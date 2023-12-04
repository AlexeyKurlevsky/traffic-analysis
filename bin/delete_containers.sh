docker-compose -f postgres-compose.yml down --volumes --rmi all
docker-compose -f superset-compose.yml down --volumes --rmi all
docker-compose -f airflow-compose.yml down --volumes --rmi all