FROM mysql:8.0.33
LABEL "Project"="Vprofile"
LABEL "Author"="Siva"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-init.d/db_backup.sql

