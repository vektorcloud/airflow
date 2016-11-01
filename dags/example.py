"""
Code that goes along with the Airflow located at:
http://airflow.readthedocs.org/en/latest/tutorial.html
"""
from airflow import DAG
from airflow.operators.docker_operator import DockerOperator
from datetime import datetime, timedelta


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2016, 10, 26),
    'email': ['airflow@airflow.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
}

dag = DAG(
    'vektorcloud-example', default_args=default_args, schedule_interval=timedelta(1)
)

t1 = DockerOperator(
    task_id="hello",
    image="ubuntu:latest",
    volumes=["/tmp/target:/target:rw"],
    command='["/bin/sh", "-c", "echo $(date) > /target/hello.txt"]',
    dag=dag,
)

t2 = DockerOperator(
    task_id="world",
    image="ubuntu:latest",
    volumes=["/tmp/target:/target"],
    command='["/bin/sh", "-c", "cat /target/hello.txt | tee /target/world.txt"]',
    dag=dag,
)

t2.set_upstream(t1)
