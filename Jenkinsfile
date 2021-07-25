pipeline{
    agent any
    tools{
        jdk "jdk"
        maven "maven"
    }
    stages {
        stage( build code) {
            steps{
                script{
                    sh 'mvn clean'
                    sh 'mvn install'
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
}