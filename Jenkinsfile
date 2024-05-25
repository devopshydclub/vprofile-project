pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK11"
    }
    stages{
        stage("TEST")
            steps{
                sh(script: 'mvn test')
            }
    }
}