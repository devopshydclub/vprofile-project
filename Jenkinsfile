pipeline {
    agent any
    tools {
        maven "maven"
        jdk "OracleJDK8"
    }
    environment{
       SNAP_REPO = 'vprofile-snapshot'
       NEXUS_USER = 'admin'
       NEXUS_PASS = 'admin123'
       RELEASE_REPO = 'vprofile-release'
       CENTRAL_REPO = 'vpro-maven-proxy'
       NEXUSIP = '172.31.82.159' 
       NEXUSPORT = '8081'
       NEXUS-GRP-REPO = 'vpr-maven-group'
       NEXUS_LOGIN = 'nexuslogin'
    }
    stages{
        stage{
            steps('build'){
                sh 'mvn -s settings.xml -DskipTests install'
            }
        }
    }
}