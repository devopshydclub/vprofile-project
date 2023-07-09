pipeline {
    agent any
    stages {
        stage("Build Artifact") {
        sh 'mvn clean package -DskipTests'
        }
    }
}