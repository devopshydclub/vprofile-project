FROM openjdk:11 AS BUILD_IMAGE
LABEL "Project"="vprofile"
LABEL "Author"="amafru"
RUN apt update && apt install maven -y
RUN git clone https://github.com/amafru/vprofile-project.git
RUN cd vprofile-project && git checkout docker && mvn install 

FROM tomcat:9-jre11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=BUILD_IMAGE vprofile-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

#The below are default values already present in the jdk package. They're listed here for learning purposes
# And also because they do not hurt to spec here 
EXPOSE 8080
CMD ["catalina.sh", "run"]
