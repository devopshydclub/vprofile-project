pipeline {
    agent any
    
    // Define Maven and JDK tools to be used
    tools {
        maven "MAVEN3"
        jdk "OracleJDK8"
    }

    // Define environment variables
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
    }

    // Define different stages of the pipeline
    stages {
        stage('Build') {
            steps {
                // Execute Maven build with skipTests option
                sh 'mvn -s settings.xml -DskipTests install'
            }
            
            post {
                success {
                    echo "Now Archiving."
                    // Archive built artifacts on successful build
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }

        stage('Test') {
            steps {
                // Execute Maven tests
                sh 'mvn -s settings.xml test'
            }
        }

        stage('Checkstyle Analysis') {
            steps {
                // Execute Maven Checkstyle plugin
                sh 'mvn -s settings.xml checkstyle:checkstyle'
            }
        }
    }
}
