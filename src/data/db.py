import pandas as pd
import os
from airflow.settings import DAGS_FOLDER
from sqlalchemy import create_engine

from src.config import SQLALCHEMY_DATABASE_URI


def upload_raw_data():
    # TODO: изначальный формат столбцов не подходит
    path = os.path.join(DAGS_FOLDER, 'data', 'test_data.tsv')
    df = pd.read_table(path, dtype=float)
    engine = create_engine(SQLALCHEMY_DATABASE_URI)
    df.to_sql('raw_data', engine, if_exists='replace')
