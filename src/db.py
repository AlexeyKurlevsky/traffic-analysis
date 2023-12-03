import pandas as pd
from sqlalchemy import create_engine

from src.config import SQLALCHEMY_DATABASE_URI


def upload_raw_data():
    # TODO: изначальный формат столбец не подходит
    df = pd.read_table('./data/test_data.tsv', dtype=float)
    engine = create_engine(SQLALCHEMY_DATABASE_URI)
    df.to_sql('raw_data', engine, if_exists='replace')
