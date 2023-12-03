import os

from dotenv import load_dotenv

load_dotenv()

DATABASE_DIALECT = os.getenv("DATABASE_DIALECT", "postgresql")
DATABASE_USER = os.getenv("DATABASE_USER", "postgres")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD", "postgres")
DATABASE_HOST = os.getenv("DATABASE_HOST", "localhost")
DATABASE_PORT = os.getenv("DATABASE_PORT", "5432")
DATABASE_DB = os.getenv("POSTGRES_MULTIPLE_DATABASES", "airflow, superset, user_traffic").split(",")[-1].strip()


# The SQLAlchemy connection string.
SQLALCHEMY_DATABASE_URI = (
    f"{DATABASE_DIALECT}://"
    f"{DATABASE_USER}:{DATABASE_PASSWORD}@"
    f"{DATABASE_HOST}:{DATABASE_PORT}/{DATABASE_DB}"
)