FROM mysql:8.0.33
LABEL "Project"="vprofile"
LABEL "Author"="Kaleem"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MSQL_DATABASE="accounts"
ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql
