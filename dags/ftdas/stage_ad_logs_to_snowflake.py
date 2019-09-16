import os
import logging

from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators import DummyOperator
from airflow.sensors.s3_key_sensor import S3KeySensor
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


DAG = DAG( #creating DAG
    "stage_ad_logs_to_snowflake", #goal of DAG is to stage ad logs to Snowflake
    default_args=DEFAULTS,
    start_date=datetime(2018, 1, 1),
    schedule_interval=JOB_ARGS["schedule_interval"],
    catchup=False
)

stage_int_sql_path = os.path.join(
    JOB_ARGS["stage_sql_path"], #stage_sql_path = adlogs/load_raw_logs
    "int"
)
stage_int_hourly_query = SqlUtils.load_query(stage_int_sql_path).split("---")
stage_int_hourly_job = SnowflakeOperator(
    task_id="stage_adlogs_int_hourly",
    snowflake_conn_id=SF_CONN_ID,
    warehouse=SF_WAREHOUSE,
    database=SF_DATABASE,
    sql=stage_int_hourly_query,
    params={
        "env": ENV 
    },
    autocommit=True,
    dag=DAG
)

stage_int_tables = DummyOperator(task_id="finish_int_rl_staging")

stage_onetag_sql_path = os.path.join(
    JOB_ARGS["stage_sql_path"],
    "onetag"
)
stage_onetag_hourly_query = SqlUtils.load_query(stage_onetag_sql_path).split("---")
stage_onetag_hourly_job = SnowflakeOperator(
    task_id="stage_adlogs_onetag_hourly",
    snowflake_conn_id=SF_CONN_ID,
    warehouse=SF_WAREHOUSE,
    database=SF_DATABASE,
    sql=stage_onetag_hourly_query,
    params={
        "env": ENV
    },
    autocommit=True,
    dag=DAG
)

stage_onetag_table = DummyOperator(task_id="finish_onetag_rl_staging")
stage_finish = DummyOperator(task_id="adlogs_snowflake_staging_finish")

# staging ad logs hourly
for table in JOB_ARGS["tables"]: #click, imp, info, seg, spot, state, track, highwinds, akamai

    stage_sql_path = os.path.join(
        JOB_ARGS["stage_sql_path"],
        table #going through each table in adlogs/load_raw_logs
    )
    STAGE_ADLOGS_HOURLY_QUERY = SqlUtils.load_query(stage_sql_path).split("---")
    stage_adlogs_hourly_job = SnowflakeOperator(
        task_id="stage_adlogs_{}_hourly".format(table),
        snowflake_conn_id=SF_CONN_ID,
        warehouse=SF_WAREHOUSE,
        database=SF_DATABASE,
        sql=STAGE_ADLOGS_HOURLY_QUERY,
        params={
            "env": ENV
        },
        autocommit=True,
        trigger_rule='all_done',
        dag=DAG
    )
    if table in JOB_ARGS["int_tables"]: #conditions for specific tables
        stage_adlogs_hourly_job >> stage_int_tables
    elif table == 'seg':
        stage_adlogs_hourly_job >> stage_onetag_table
    else:
        manifest_bucket_key = os.path.join(
                JOB_ARGS["mii_table_path"].format(table),
                DATEHOUR_PATH,
                JOB_ARGS["mii_manifest_path"]
        )
        check_for_logs_job = S3KeySensor(
            task_id="{}_logs_all_present".format(table),
            aws_conn_id=AWS_CONN_ID,
            bucket_name=AWS_BUCKET_NAME,
            bucket_key=manifest_bucket_key,
            wildcard_match=True,
            retries=0,
            execution_timeout=timedelta(minutes=5),
            dag=DAG
        )
        check_for_logs_job >> stage_adlogs_hourly_job >> stage_finish

stage_onetag_table >> stage_onetag_hourly_job >> stage_finish
stage_int_tables >> stage_int_hourly_job >> stage_finish
