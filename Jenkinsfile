pepeline {
    agent any
    tools {
        maven "MAVEN3"
        JDK "ORACLEJDK8"
    }

    environment{
        SNAP_REPO = 'vprofile-snapshot'
        NEXUS_USER = 'admin'
        NEXUS_PAAA = 'admin123'
        RELEASE_REPO = 'vpro-maven-central'
        NEXUSIP = '172.31.37.95'
        NEXUSPORT = '8081'
        NEXUS_GRP_REPO = 'vpro-maven-group'
        NEXUS_LOGIN = 'nexuslogin'
    }
    stages{
        stage('Build'){
            steps {
                sh 'mvn -s settings.xml -DskipTests install'

            }
        }
    }
    

}