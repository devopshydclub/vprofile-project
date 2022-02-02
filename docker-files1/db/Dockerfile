FROM mysql:5.7.25
LABEL "Project"="Vprofile"
LABEL "Author"="Shukurat"

ENV MYSQL_ROOT_PASSWORD="vprodpass"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql