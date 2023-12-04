from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

from src.data.db import upload_raw_data

with DAG(
    'EDA',
    start_date=datetime(2023, 2, 1),
    schedule_interval='@daily',
    catchup=False
):
    python_task = PythonOperator(
        task_id='uploading_raw_data',
        python_callable=upload_raw_data,
    )

python_task
