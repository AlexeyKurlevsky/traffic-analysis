FROM apache/airflow:2.7.3-python3.8
COPY requirements.txt .
RUN pip install -r requirements.txt

USER default
COPY --chown=default:airflow ./src /opt/airflow/dags/src/
COPY --chown=default:default ./data /opt/airflow/dags/data/
