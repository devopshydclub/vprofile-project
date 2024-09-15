pipeline { 
	agent any 
    tools{
        maven 'MAVEN3'
        jdk 'jdk8'
    }
	
    environment{
        SNAP_REPO='vprofile-snapshot'
        NEXUS_USER ='admin'
        NEXUS_PASS ='admin123'
        RELEASE_REPO ='vprofile-release'
        CENTRAL_REPO ='vpro-maven-central'
        NEXUSIP ='10.0.0.4'
        NEXUSPORT ='8081'
        NEXUS_GRP_REPO ='vpro-maven-group'
        NEXUS_LOGIN ='nexuslogin' 
        SONARSERVER = 'sonarserver'
        SONARSCANNER = 'sonarscanner'
    }

    stages{ 
        stage('build'){
            steps {
                sh 'mvn -s settings.xml -DskipTests install'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        } 

        stage('Test'){
        steps{
            sh 'mvn -s settings.xml test'
        }
    }

    stage('Checkstyle Analysis'){
        steps{
            sh 'mvn -s settings.xml checkstyle:checkstyle'
        }
    }
    }

    
}
