FROM mysql

ENV MYSQL_ROOT_PASSWORD="vpropass"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/accountsdb.sql
