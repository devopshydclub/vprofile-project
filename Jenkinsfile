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
		stage ('Copy Artifact to Nexus Job'){
            steps {
                sh 'cp /var/lib/jenkins/workspace/Vprofile-pipeline/target/vprofile-v3.war /var/lib/jenkins/workspace/Vprofile-Nexus-Versioning/vprofile-v3.war'
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
		
        stage ('Copy Artifact to Staging Deploy Job'){
            steps {
                sh 'cp /var/lib/jenkins/workspace/Vprofile-pipeline/target/vprofile-v3.war /var/lib/jenkins/workspace/Vprofile-Deploy-to-Staging/vprofile-v3.war'
            }
            post {
                success {
                    echo 'Artifact Copied'
                }
            }
        }
		
        stage ('Staging Deployment'){
            steps {
                build job: 'Vprofile-Deploy-to-Staging'
            }
        }
        }


    }
