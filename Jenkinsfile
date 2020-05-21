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
                sh 'cp /var/lib/jenkins/workspace/vprofile-pipeline/target/vprofile-v4.1war /var/lib/jenkins/workspace/vprofile-nexus-versioning/vprofile-v4.1.war'
            }
            post {
                success {
                    echo 'Artifact Copied'
                }
            }
        }
        stage ('Nexus Versioning'){
            steps {
                build job: 'vprofile-nexus-versioning'
            }
        }
		
        stage ('Copy Artifact to Staging Deploy Job'){
            steps {
                sh 'cp /var/lib/jenkins/workspace/vprofile-pipeline/target/vprofile-v4.1.war /var/lib/jenkins/workspace/vprofile-deploy-to-staging/vprofile-v4.1.war'
            }
            post {
                success {
                    echo 'Artifact Copied'
                }
            }
        }
		
        stage ('Staging Deployment'){
            steps {
                build job: 'vprofile-deploy-to-staging'
            }
        }
        }


    }
