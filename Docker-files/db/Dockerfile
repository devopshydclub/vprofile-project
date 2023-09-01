FROM mysql:8.0.33
LABEL "project"="Vprofile"
LABEL "Author"="Bhavana"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql
