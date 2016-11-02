#!/bin/sh

if [ ! -d "/airflow/airflow.db" ]; then
  airflow initdb
fi

if [ $# -eq 0 ]; then
  airflow scheduler & airflow webserver
else
  exec "$@"
fi

