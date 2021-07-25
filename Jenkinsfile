pipeline{
    agent any
    stages{
        
        stage('BUILD'){
            steps {
                sh 'mvn clean install -DskipTests'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }

	    stage('UNIT TEST'){
            steps {
                sh 'mvn test'
            }
        }

	    stage('INTEGRATION TEST'){
            steps {
                sh 'mvn verify -DskipUnitTests'
            }
        }
        stage("build & SonarQube analysis") {
          steps{
              script{
        withSonarQubeEnv(credentialsId: 'sonarqubetoken', installationName: 'sonarqube') {      withSonarQubeEnv('My SonarQube Server') {
                 sh 'mvn clean package sonar:sonar'
                  }    
                }
            }
        }
        stage("Quality Gate"){
          timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
                }
            }
        }        
    }    
}    
