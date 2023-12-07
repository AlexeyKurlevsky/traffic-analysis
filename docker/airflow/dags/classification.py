from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

from src.model import classification

with DAG(
    'Classification',
    start_date=datetime(2023, 2, 1),
    schedule_interval='@daily',
    catchup=False
):
    class_user = PythonOperator(
        task_id='classification_data',
        python_callable=classification,
    )

class_user
