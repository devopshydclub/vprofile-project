def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]
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
        SONARSERVER = 'sonarserver'
        SONARSCANNER = 'sonarscanner'
    }

    // Define different stages of the pipeline
    stages {
        // Stage 1: Build
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

        // Stage 2: Test
        stage('Test') {
            steps {
                // Execute Maven tests
                sh 'mvn -s settings.xml test'
            }
        }

        // Stage 3: Checkstyle Analysis
        stage('Checkstyle Analysis') {
            steps {
                // Execute Maven Checkstyle plugin
                sh 'mvn -s settings.xml checkstyle:checkstyle'
            }
        }

        // Stage 4: Sonar Analysis
        stage('Sonar Analysis') {
            environment {
                scannerHome = tool "${SONARSCANNER}"
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

        // Stage 5: Quality Gate
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                }
            }
        }

        stage("UploadArtifact"){
            steps{
                nexusArtifactUploader(
                  nexusVersion: 'nexus3',
                  protocol: 'http',
                  nexusUrl: "${NEXUSIP}:${NEXUSPORT}",
                  groupId: 'vprofileQA',
                  version: "${env.BUILD_ID}-${env.BUILD_TIMESTAMP}",
                  repository: "${RELEASE_REPO}",
                  credentialsId: "${NEXUS_LOGIN}",
                  artifacts: [
                    [artifactId: 'vproapp',
                     classifier: '',
                     file: 'target/vprofile-v2.war',
                     type: 'war']
                  ]
                )
            }
        }
    }
    post {
        always {
            echo 'Slack Notifications.'
            slackSend channel: '#devopsci',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}