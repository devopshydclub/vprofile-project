# Use OpenJDK 11 for the build stage
FROM openjdk:11 AS build

# Install Maven
RUN apt-get update && apt-get install -y maven git

# Clone the repository and build the project
RUN git clone https://github.com/VANSH3104/vprofile-project.git /vprofile-project
WORKDIR /vprofile-project
RUN git checkout docker && mvn clean install
LABEL "project"="vprofile"
LABEL "author"="vansh"
# Use Tomcat 9 for the runtime stage
FROM tomcat:9-jre11

# Remove the default webapps to clean the environment
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the build stage
COPY --from=build /vprofile-project/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for the application
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
