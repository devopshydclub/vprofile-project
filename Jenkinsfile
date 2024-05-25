def COLOR_MAP = [
    'SUCCESS': 'good',
    'FAILURE': 'danger',
]
pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK11"
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
                sh(script: 'mvn clean -s settings.xml -DskipTests install')
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
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            } 
        }
        stage("PUBLISH ARTIFACTS"){
            steps{
                nexusArtifactUploader(
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            nexusUrl: "${NEXUSIP}:${NEXUSPORT}",
                            groupId: "QA",
                            version: "${env.BUILD_ID}-${env.BUILD_TIMESTAMP}",
                            repository: "${NEXUS_REPOSITORY}",
                            credentialsId: "${NEXUS_CREDENTIAL_ID}",
                            artifacts: [
                                [artifactId: 'vproapp',
                                classifier: '',
                                file: 'target/vprofile-v2.war',
                                type: "war"]
                            ]
                )
            }
        }
       
    }
    post{
        always{
            echo "Slack Notification"
            slackSend channel: '#dev-ops',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} Build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
    
}