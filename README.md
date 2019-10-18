# airflow

![circleci][circleci]

Tiny Alpine image for running Apache Airflow

### Running

    docker run -p 8080:8080 -e AIRFLOW_INIT_DB=1 -v /var/run/docker.sock:/var/run/docker.sock --rm -it quay.io/vektorcloud/airflow:latest


[circleci]: https://img.shields.io/circleci/build/gh/vektorcloud/airflow?color=1dd6c9&logo=CircleCI&logoColor=1dd6c9&style=for-the-badge "airflow"
