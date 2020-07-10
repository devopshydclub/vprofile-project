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
                sh 'cp /var/lib/jenkins/workspace/vprofile-pipeline/target/vprofile-v2.war /var/lib/jenkins/workspace/vprofile-nexus-versioning/vprofile-v2.war'
            }
            post {
                success {
                    echo 'Artifact Copied'
                }
            }
        }
       freeStyleJob('NexusArtifactUploaderJob') {
        steps {
         nexusArtifactUploader {
         nexusVersion('nexus3')
         protocol('http')
         nexusUrl('172.31.22.110:8080')
         groupId('sp.sd')
         version('2.4')
         repository('vprofile-repo')
         credentialsId('ff8f0688-e38e-4cc6-938c-dcbb8d8cb2df')
         artifact {
            artifactId('nexus-artifact-uploader')
            type('war')
            classifier('debug')
            file('vprofile-v2.war')
         }
         }
        }
       }

		
		
        
        }


    }

