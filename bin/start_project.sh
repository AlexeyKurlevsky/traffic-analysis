docker-compose -f postgres-compose.yml up -d
docker-compose -f airflow-compose.yml up -d --build
docker-compose -f superset-compose.yml up -d