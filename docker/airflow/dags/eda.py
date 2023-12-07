from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

from src.db import upload_raw_data, calculate_duration, calc_clicks_dynamic, delete_noise

with DAG(
    'EDA',
    start_date=datetime(2023, 2, 1),
    schedule_interval='@daily',
    catchup=False
):
    raw_data = PythonOperator(
        task_id='uploading_raw_data',
        python_callable=upload_raw_data,
    )

    user_click = PythonOperator(
        task_id='calculate_users_click',
        python_callable=calculate_duration
    )

    clean_data = PythonOperator(
        task_id='remove_noise',
        python_callable=delete_noise
    )

    click_dynamic = PythonOperator(
        task_id='calculate_user_dynamics',
        python_callable=calc_clicks_dynamic
    )

raw_data >> user_click >> [click_dynamic, clean_data]
