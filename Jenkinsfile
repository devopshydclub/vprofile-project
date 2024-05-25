pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK17"
    }

    environment {
        NEXUS_USER = "admin"
        NEXUS_PASS = "admin"
        NEXUS_VERSION = "admin"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "4.240.74.220:8081"
        NEXUSIP = "4.240.74.220"
        NEXUSPORT = "8081"
        NEXUS_REPOSITORY = "vprofile-release"
	    NEXUS_REPO_ID  = "vprofile-release"
        CENTRAL_REPO = "vpro-maven-central"
        NEXUS_GRP_REPO = "vpro-maven-group" 
        NEXUS_CREDENTIAL_ID = "nexuslogin"
        SNAP_REPO = "vprofile-snapshot"
        ARTVERSION = "${env.BUILD_ID}"
        SONARSCANNER = "sonarscanner"
        SONARSERVER = "sonarserver"

    }
    stages{
        stage('BUILD'){
            steps{
                sh(script: 'mvn -s settings.xml -DskipTests install')
            }
            post{
                success{
                    echo "now Archiving"
                    archiveArtifacts(artifacts: '**/target/*.war')
                }
            }
        }
        stage('UNIT TEST'){
            steps{
                sh(script: 'mvn test')
            }
        }
        stage('INTEGRATION TEST'){
            steps{
                sh(script: 'mvn verify -DskipUnitTests')
            }
        }
        stage('CODE ANALYSIS WITH CHECKSYTLE'){
            steps{
                sh(script: 'mvn checkstyle:checkstyle')
            }
            post{
                success{
                    echo "Generated Analysis Result"
                }
            }
        }
        stage('CODE ANALYSIS WITH SONARQUBE'){
            environment{
                scannerHome = tool "sonarscanner"
            }
            steps{
                withSonarQubeEnv("${SONARSERVER}"){
                sh '''${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=vprofile \
                   -Dsonar.projectName=vprofile-repo \
                   -Dsonar.projectVersion=1.0 \
                   -Dsonar.sources=src/ \
                   -Dsonar.java.binaries=target/test-classes/com/visualpathit/account/controllerTest/ \
                   -Dsonar.junit.reportsPath=target/surefire-reports/ \
                   -Dsonar.jacoco.reportsPath=target/jacoco.exec \
                   -Dsonar.java.checkstyle.reportPaths=target/checkstyle-result.xml'''
                }
            }
        }
        stage("QG CHECK"){
            steps{
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
    
}