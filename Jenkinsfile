pipeline{
    agent any
    tools{
        jdk "jdk"
        maven "maven"
    }
    stages {
        stage(maven build) {
            steps{
                script{
                    sh 'mvn clean'
                    sh 'mvn install'
                }
            }
        }
    }
    stage(integrate test){
        steps{
            script{
                sh 'mvn test'
            }
        }
    }
    