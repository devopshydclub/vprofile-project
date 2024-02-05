FROM mysql:8.0.33
LABEL "project"="vprofile"

ENV MYSQL_ROOT_PASSWORD="password"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql
