import os
import logging

from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators import DummyOperator
from airflow.sensors.s3_key_sensor import S3KeySensor
from airflow.sensors import ExternalTaskSensor
from airflow.contrib.operators.snowflake_operator import SnowflakeOperator
from datetime import datetime, timedelta

# custom utils
from ftdas.utils.job_config import JobConfig
from ftdas.utils.sql_utils import SqlUtils

JOB_ARGS = JobConfig.get_config()
DEFAULTS = JOB_ARGS["default_args"]
ENV = JOB_ARGS["env_name"] #dev
DATEHOUR_PATH = '{{ execution_date.strftime("%Y%m%d/%H") }}'
AWS_CONN_ID = JOB_ARGS["ftdas_aws_conn_id"]
AWS_BUCKET_NAME = JOB_ARGS["ftdas_aws_rl_bucket_name"]
SF_CONN_ID = JOB_ARGS["ftdas_snowflake_conn_id"]
SF_ROLE = JOB_ARGS["snowflake"]["role"]
SF_WAREHOUSE = JOB_ARGS["snowflake"]["warehouse"]
SF_DATABASE = JOB_ARGS["snowflake"]["database"]

TRANSFORM_SCHEMA = "transform_schema"
BUSINESS_SCHEMA = "ssc_business"


DAG = DAG( #creating DAG
    "transform", #goal of DAG is to transform new log data
    default_args=DEFAULTS,
    start_date=datetime(2018, 1, 1),
    schedule_interval=JOB_ARGS["schedule_interval"],
    catchup=False
)

# sensor that waits on the completion of stage_ad_logs_to_snowflake
adlogs_sensor = ExternalTaskSensor(
    task_id="wait_for_stage", # this sensor's name
    external_dag_id="stage_ad_logs_to_snowflake", # DAG to reference
    external_task_id="adlogs_snowflake_staging_finish", # task to wait on
    execution_delta=timedelta(minutes=5),
    dag=DAG
)

#dummy op for finish task
transform_finish = DummyOperator(task_id="finish_transforms")

#loop through .yaml list and create sql transform tasks for relevant tables
for table in JOB_ARGS["tables"]:
    #set path to .sql file
    query_log = [] #create empty list to hold sql queries for a given table
    for process in JOB_ARGS["tables"][table]: #loop through processses in the .yaml for a given table
        sql_path = os.path.join(
            JOB_ARGS["stage_sql_path"], #stage_sql_path = adlogs/log_process/filename.sql
            process)
        sql_query = SqlUtils.load_query(sql_path).split("---") # sql_query is a list of all the queries in a given .sql file, seperated by '---'
        query_log += sql_query

        #for i in range(len(sql_query)):
        #     query_log.append(sql_query[i]) # using .append() instead of +=

    #create task with appropriate sql query
    transform_task = SnowflakeOperator(
        task_id="{}_transform".format(table),
        snowflake_conn_id=SF_CONN_ID,
        warehouse=SF_WAREHOUSE,
        database=SF_DATABASE,
        sql=query_log, # here is where we pass in the query log
        params={ #set strings to reference in the .sql scripts
            "env": ENV,
            "table": table,
            "database": SF_DATABASE, #ft_db_dev
            "transform_schema": TRANSFORM_SCHEMA, #transform_schema
            "business_schema": BUSINESS_SCHEMA #ssc_business
        },
        autocommit=True,
        dag=DAG
    )

    adlogs_sensor >> transform_task >> transform_finish
