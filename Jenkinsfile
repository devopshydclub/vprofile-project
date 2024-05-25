pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK11"
    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }

    }
    stages{
        stage("TEST"){
            steps{
                sh(script: 'mvn clean install -DskipTests')
            }
        }
    }
}