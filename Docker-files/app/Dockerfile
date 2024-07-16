FROM openjdk:11 AS BUILD_IMAGE
LABEL "project"="vprofile"
LABEL "Aythor"="Junaid"
RUN apt update && apt install maven -y
RUN git clone https://github.com/devopshydclub/vprofile-project.git
RUN cd vprofile-project && git checkout docker && mvn install

FROM tomacat:9-jre11
LABEL "project"="vprofile"
LABEL "Aythor"="Junaid"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE vprofile-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]