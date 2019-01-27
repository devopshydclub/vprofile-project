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
}