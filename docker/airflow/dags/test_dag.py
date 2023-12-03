from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

from src.db import upload_raw_data

my_dag = DAG(
    'simple_python_dag',
    start_date=datetime(2023, 2, 1),
    schedule_interval='@daily'
)

python_task = PythonOperator(
    task_id='python_task',
    python_callable=upload_raw_data(),
    dag=my_dag
)
