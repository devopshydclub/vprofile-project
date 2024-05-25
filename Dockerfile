FROM tomcat:9-jre11
WORKDIR /usr/local/tomcat/webapps

RUN  curl -u admin:admin -X GET http://4.240.74.220:8081/repository/vprofile-release/QA/vproapp/62-26-05-24%2000%3A50/vproapp-62-26-05-24%2000%3A50.war -o ROOT.war
COPY vproapp* /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]