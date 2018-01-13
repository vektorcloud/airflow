# airflow

![circleci][circleci]

Tiny Alpine image for running Apache Airflow

### Running

    docker run -p 8080:8080 -e AIRFLOW_INIT_DB=1 -v /var/run/docker.sock:/var/run/docker.sock --rm -it quay.io/vektorcloud/airflow:latest


[circleci]: https://img.shields.io/circleci/project/github/vektorcloud/airflow.svg "airflow"
