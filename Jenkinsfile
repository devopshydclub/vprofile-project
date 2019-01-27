pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                sh 'mvn install'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
		stage ('Code Analysis'){
            steps {
                sh 'mvn checkstyle:checkstyle'
            }
            post {
                success {
                    echo 'Generated Analysis Result'
                }
            }
        }
		stage ('Code Artifact to Nexus Job'){
            steps {
                sh 'cp /var/lib/jenkins/workspace/Vprofile-pipeline/target/vprofile-v2.war /var/lib/jenkins/workspace/Vprofile-Nexus-Versioning/vprofile-v2.war'
            }
            post {
                success {
                    echo 'Artifact Copied'
                }
            }
        }
        stage ('Nexus Versioning'){
            steps {
                build job: 'Vprofile-Nexus-Versioning'
            }
        }

        stage ('Staging Deployment'){
            steps {
                build job: 'VPorfile-Deploy-to-Staging'
            }
        }
        }


    }
