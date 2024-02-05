pipeline {
    agent any
    tools {
        maven "MAVEN3"
        jdk "OracleJDK8"
    }
    
    environment {
        SNAP_REPO = 'vprofile-snapshot'
        NEXUS_USER = 'admin'
        NEXUS_PASS = 'admin'
        RELEASE_REPO = 'vprofile-release'
        CENTRAL_REPO = 'vpro-maven-central'
        NEXUSIP = '172.31.88.224'
        NEXUSPORT ='8081'
        NEXUS_GRP_REPO = "vpro-maven-group"
        NEXUS_LOGIN = 'nexuslogin'

        SONARSERVER= 'sonarserver'
        SONARSCANNER= 'sonarscanner'
    }

    stages {
        stage ('Build') {
            steps {
                sh 'mvn -s settings.xml -DskipTests install' //maven will build based on settings.xml and skip test
            }

            post {
                success {
                    echo "Now Archiving"
                    archiveArtifacts artifacts: '**/*.war' //archeive everything thats ends with .war
                }
            }
        }

        // unit tests and this will upload in sonarqube later
        stage('Test') {
            steps {
                sh 'mvn -s settings.xml test'
            }
        }

        // checkstyle analysis, this will check any issue with the code.       
        stage ('Checkstyle Analysis') {
            steps {
                sh 'mvn -s settings.xml checkstyle:checkstyle'
            }
        }

         // sonarqube step
        stage ('Sonar Analysis') {
            environment {
                scannerHome = tool "${SONARSCANNER}" //local variable=scannerHome and we are storing global variable here
            }
            steps {
                withSonarQubeEnv("${SONARSERVER}") {
                   sh """${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
                   -Dsonar.projectName=vprofile \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml"""
                }
            }
        }


    }
}