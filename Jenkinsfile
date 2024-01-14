pipeline {
    agent any
    tools {
        maven "MAVEN3"
        jdk "OracleJDK8"
    }
    environment {
        SNAP_REPO = 'vprofile-snapshot'
        NEXUS_USER = 'admin'
        NEXUS_PASS = 'madhu'
        RELEASE_REPO = 'vprofile-release'
        CENTRAL_REPO = 'vpro-maven-central'
        NEXUSIP = '172.31.30.234'
        NEXUSPORT = '8081'
        NEXUS_GRP_REPO = 'vpro-maven-group'
        NEXUS_LOGIN = 'nexuslogin'
        JAVA_HOME = /usr/lib/jvm/java-1.8.0-openjdk-amd64   // Replace with the actual path to Java home
    }

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'export JAVA_HOME=$JAVA_HOME && mvn -s settings.xml -DskipTests install'
                }
            }
        }
    }
}
