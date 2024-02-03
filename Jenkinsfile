pipeline{
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
        NEXUSIP = '172.31.93.170'
        NEXUSPORT ='8081'
	    NEXUS_GRP_REPO = "vpro-maven-group"
        NEXUS_LOGIN = 'nexuslogin'

        SONARSERVER = 'sonarserver'
        SONARSCANNER = 'sonarscanner'
    }


    stages {
        stage ('Build'){
            steps {
                sh 'mvn -s settings.xml -DskipTests install'
            }

            post {
                success {
                    echo "Now Archieving"
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
//unit tests
        stage('Test'){
            steps {
                sh 'mvn -s settings.xml test'
            }
        }

//checkstyle analysis        
        stage ('Checkstyle Analysis'){
            steps {
                sh 'mvn -s settings.xml checkstyle:checkstyle'
            }
        }

//sonarqube step-
        stage ('Sonar Analysis'){
            environment {
                scannerHome = tool "${SONARSCANNER}"
            }
            steps {
                withSonarQubeEnv("${SONARSERVER}") {
                   sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
                   -Dsonar.projectName=vprofile \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
                }
            }

        }

 //quality gates
        stage("Quality Gate") {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    // parameter indicate wheather to set piepline to UNSTABLE
                    //true= set piepline to UNSTABLE, false = don,t
                    waitForQualityGate abortPipeline: true
                }
            }
        }      
    }
}
