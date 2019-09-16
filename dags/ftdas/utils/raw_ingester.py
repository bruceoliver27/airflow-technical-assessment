import os
import logging
import re

from airflow import DAG
from airflow.contrib.operators.snowflake_operator import SnowflakeOperator

# custom utils
from ftdas.utils.job_config import JobConfig
from ftdas.utils.sql_utils import SqlUtils
from ftdas.utils.utils import Utils

class RawIngester(Utils):

    @staticmethod
    def load_raw_ingester_table(
            job_args,
            defaults,
            table,
            beid_list,
            parent_dag_name,
            start_date,
            schedule_interval,
            sf_conn_id,
            sf_role,
            sf_warehouse,
            sf_database,
            env
            ):
        dag = DAG(
            "{}.{}".format(parent_dag_name, table),
            default_args = defaults,
            start_date = start_date,
            schedule_interval = schedule_interval,
            catchup = False,
            concurrency = 32
        )

        sql_path = os.path.join(
            job_args["ingester_sql_path"],
            table
        )

        for raw_beid in beid_list:
            beid = re.search('.*client=([0-9]+)\/',raw_beid).group(1)

            raw_ingester_query = SqlUtils.load_query(sql_path).replace("[beid_param]",raw_beid).split("---")

            per_beid_task = SnowflakeOperator(
                task_id=beid,
                snowflake_conn_id=sf_conn_id,
                warehouse=sf_warehouse,
                database=sf_database,
                sql=raw_ingester_query,
                params={
                    "env": env,
                    "table": table
                },
                autocommit=True,
                dag=dag
            )

        return dag


