# airflow
[![Circle CI](https://circleci.com/gh/vektorcloud/airflow.svg?style=svg)](https://circleci.com/gh/vektorcloud/airflow)

Tiny Alpine image for running Apache Airflow

### Running

    docker run -p 8080:8080 -e AIRFLOW_INIT_DB=1 -v /var/run/docker.sock:/var/run/docker.sock --rm -it quay.io/vektorcloud/airflow:latest

