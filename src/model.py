import os

import pandas as pd
import numpy as np
import xgboost as xgb
import pickle
import logging

from airflow import AirflowException
from airflow.settings import DAGS_FOLDER

from src.config import engine


def classification() -> None:
    query = ('SELECT devtype, brotype, duration, domhash, siteid '
             'FROM user_duration '
             'WHERE flg = 1;')
    df = pd.read_sql(query, engine)
    n_init = df.shape[0]
    if n_init == 0:
        raise AirflowException('No data for classification. Please, start EDA dag')

    df['log_duration'] = np.log(df['duration'].values)

    raw_path = ['models', 'scalers', 'standard_scaler.pkl']
    path_scaler = os.path.join(DAGS_FOLDER, *raw_path)
    
    raw_path[-1] = 'minmax_scaler.pkl'
    path_minmax = os.path.join(DAGS_FOLDER, *raw_path)
    with open(path_scaler, 'rb') as f:
        scaler = pickle.load(f)
    logging.info('Standard scaler uploaded successfully')
    with open(path_minmax, 'rb') as f:
        minmax = pickle.load(f)
    logging.info('MinMax scaler uploaded successfully')
    df = df[['devtype', 'brotype', 'log_duration', 'domhash', 'siteid']]

    df = df[np.isfinite(df).all(1)]  # remove infinity value
    data_scaled = scaler.transform(df)
    data_scaled = pd.DataFrame(data=data_scaled, columns=df.columns, index=df.index)

    data_scaled = minmax.transform(data_scaled)
    data_scaled = pd.DataFrame(data=data_scaled, columns=df.columns, index=df.index)

    raw_path = ['models', 'classificator', 'xgb_model.json']
    path_model = os.path.join(DAGS_FOLDER, *raw_path)
    model = xgb.XGBClassifier()
    model.load_model(path_model)
    logging.info('Model uploaded successfully')

    y_pred = model.predict(data_scaled)

    df['class'] = y_pred
    df.to_sql('classification', engine, if_exists='replace', index=False)
