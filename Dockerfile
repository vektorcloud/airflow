FROM quay.io/vektorcloud/scipy:latest

ENV COMPONENTS="celery,hive,mysql,s3,slack"

RUN apk add --no-cache \
  bash \
  libxslt \
  libxslt-dev \
  libxml2 \
  libxml2-dev  \
  linux-headers \
  && apk --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community add dumb-init \
  && CFLAGS="-I/usr/include/libxml2" \
  pip install --no-cache-dir airflow["$AIRFLOW_COMPONENTS"] celery docker-py

EXPOSE 8080
VOLUME /airflow

COPY dags/ /airflow/dags
COPY entrypoint.sh /

ENV \ 
  AIRFLOW__CORE__AIRFLOW_HOME=/airflow \
  AIRFLOW__CORE__DAGS_FOLDER=/airflow/dags \
  AIRFLOW__CORE__BASE_LOG_FOLDER=/airflow/logs \
  AIRFLOW__CORE__PLUGINS_FOLDER=/airflow/plugins \
  AIRFLOW__CORE__EXECUTOR=SequentialExecutor \
  AIRFLOW__CORE__SQL_ALCHEMY_CONN=sqlite:////airflow/airflow.db \
  AIRFLOW__CORE__LOAD_EXAMPLES=False

CMD ["airflow", "webserver"]
ENTRYPOINT ["/entrypoint.sh"]
