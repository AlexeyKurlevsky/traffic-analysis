FROM apache/airflow:2.7.3-python3.8

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY ./docker/airflow/dags /opt/airflow/dags/
COPY ./src /opt/airflow/dags/src/
COPY ./data /opt/airflow/dags/data/
