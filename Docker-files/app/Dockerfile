<<<<<<< HEAD
FROM openjdk:11 AS BUILD_IMAGE
RUN apt update && apt install maven -y
RUN git clone https://github.com/purnimasahoo/devops-project.git
RUN cd devops-project && git checkout docker && mvn install

FROM tomcat:9-jre11
RUN rm -rf /usr/local/webapps/*
COPY --from=BUILD_IMAGE devops-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
=======
>>>>>>> a7a5524487389d971acdd6a427d7581a8c703abd
