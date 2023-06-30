FROM mysql:8.0.33
LABEL "Project"="vprofile"
LABEL "Author"="amafru"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/db_backup.sql

#The below are default values already present in the jdk package. They're listed here for learning purposes
# And also because they do not hurt to spec here 
EXPOSE 3306
