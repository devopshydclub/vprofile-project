FROM tomcat:9-jre11
WORKDIR /usr/local/tomcat/webapps

RUN  curl -u admin:admin -X GET http://4.240.74.220:8081/repository/vprofile-release/QA/vproapp/63-26-05-24%2001%3A01/vproapp-63-26-05-24%2001%3A01.war -o ROOT.war
COPY vproapp* /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]