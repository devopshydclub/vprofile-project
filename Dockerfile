FROM tomcat:9-jre17
WORKDIR /usr/local/tomcat/webapps

RUN curl -lO http://4.240.74.220:8081/repository/vprofile-release/QA/vproapp/55-25-05-24%2022%3A29/vproapp-55-25-05-24%2022%3A29.war
COPY vproapp* /usr/local/tomcat/webapps/ROOT.war
RUN mv *.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]