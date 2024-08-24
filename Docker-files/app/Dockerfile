FROM openjdk:11 AS BUILD_IMAGE
RUN apt update && install maven -y
RUN git clone https://github.com/luanndm-dream/nothing-devops-v1.git
RUN cd nothing-devops-v1 && git checkout docker && mvn install - y

FROM tomcat:9-jre11
LABEL "Project"="Vprofile"
LABEL "Author"="Nothing"
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE nothing-devops-v1/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh","run"]
