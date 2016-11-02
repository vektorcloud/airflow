FROM quay.io/vektorcloud/scipy:latest

RUN pip install --no-cache-dir airflow[hive] docker-py && \
  apk add --no-cache bash # https://github.com/apache/incubator-airflow/blob/master/airflow/jobs.py#L1977

EXPOSE 8080
VOLUME /dags

COPY dags/ /dags
COPY entrypoint.sh /

ENV AIRFLOW__CORE__DAGS_FOLDER=/dags
ENV AIRFLOW__CORE__EXECUTOR=SequentialExecutor
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

ENTRYPOINT ["/entrypoint.sh"]
