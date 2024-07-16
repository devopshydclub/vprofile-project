FROM mysql:8.0.33
LABEL "project"="Vprofile"
LABEL Authore="Junaid"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MUSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql
