#!/usr/bin/dumb-init /bin/sh

if [ "$AIRFLOW_INIT_DB" -eq 1 ]; then
  airflow initdb
fi

exec "$@"
