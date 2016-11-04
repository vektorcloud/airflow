FROM quay.io/vektorcloud/scipy:latest

RUN pip install --no-cache-dir airflow[hive] docker-py && \
  apk add --no-cache bash && \
  apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community add dumb-init

EXPOSE 8080
VOLUME /airflow

COPY dags/ /airflow/dags
COPY entrypoint.sh /

ENV AIRFLOW__CORE__AIRFLOW_HOME=/airflow
ENV AIRFLOW__CORE__DAGS_FOLDER=/airflow/dags
ENV AIRFLOW__CORE__BASE_LOG_FOLDER=/airflow/logs
ENV AIRFLOW__CORE__PLUGINS_FOLDER=/airflow/plugins
ENV AIRFLOW__CORE__EXECUTOR=SequentialExecutor
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=sqlite:////airflow/airflow.db
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

ENTRYPOINT ["/entrypoint.sh"]
