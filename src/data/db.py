import os
import logging
import pandas as pd
import numpy as np
from airflow.settings import DAGS_FOLDER

from src.config import engine, PERIOD_NS


def upload_raw_data() -> None:
    # TODO: изначальный формат столбцов не подходит
    path = os.path.join(DAGS_FOLDER, 'data', 'test_data.tsv')
    df = pd.read_table(path, dtype=float)
    logging.info('data read successfully')
    df.to_sql('raw_data', engine, if_exists='replace', index=False)


def calculate_duration() -> None:
    query = 'SELECT * FROM raw_data;'
    df = pd.read_sql(query, engine)

    df_sort = df.sort_values(by=['user', 't'], ascending=True, axis=0)
    df_sort['duration'] = df_sort.groupby(by=['user'])['t'].rolling(window=2).apply(
        lambda x: x.iloc[1] - x.iloc[0]).values
    df_sort['flg'] = df_sort.groupby(by=['user'])['tn'].rolling(window=2).apply(
        lambda x: 1 if x.iloc[1] == 1 and x.iloc[0] == 0 else 0).values
    df_sort.fillna(value=0, inplace=True)
    df_sort.to_sql('user_duration', engine, if_exists='replace', index=False)


def delete_noise() -> None:
    query = 'SELECT * FROM user_duration;'
    df = pd.read_sql(query, engine)
    n_init = df.shape[0]

    df_user_click = df[df['flg'] == 1]
    df_user_click['log_duration'] = np.log(df_user_click['duration'].values)
    df_user_click = tukey_noise(df_user_click, 'log_duration')
    n_temp = df_user_click.shape[0]
    logging.info(f'Remove noises {n_init - n_temp}')
    df_user_click.to_sql('clean_data_user_duration', engine, if_exists='replace', index=False)


def calc_clicks_dynamic() -> None:
    query = 'SELECT * FROM raw_data;'
    df = pd.read_sql(query, engine)

    df_sort_by_time = df[df['tn'] == 1].sort_values(by=['t'], ascending=True, axis=0)

    df_count_user = df_sort_by_time.groupby(by=['t'], as_index=False)['user'].count()
    df_count_user['sum'] = df_count_user['user'].cumsum()
    df_count_user['date'] = pd.to_datetime(df_count_user['t'])

    period_ns = PERIOD_NS
    df_grouped = df_count_user.groupby(pd.Grouper(key='date', freq=f'{period_ns}ns'))
    df_avg = df_grouped['user'].sum()
    df_avg = df_avg.to_frame()
    df_avg.rename(columns={'user': 'count_clicks'}, inplace=True)
    df_avg['ts'] = df_avg.index.values.astype(np.int64)
    df_avg.to_sql('click_dynamics', engine, if_exists='replace', index=False)


def tukey_noise(df: pd.DataFrame, column: str) -> pd.DataFrame:
    q1 = df[column].quantile(0.25)
    q3 = df[column].quantile(0.75)
    iqr = q3 - q1
    df = df[(df[column] >= q1 - 1.5*iqr) & (df[column] <= q3 + 1.5*iqr)]
    return df
