pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK11"

    environment {
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "172.31.40.209:8081"
        NEXUS_REPOSITORY = "vprofile-release"
	    NEXUS_REPO_ID    = "vprofile-release"
        NEXUS_CREDENTIAL_ID = "nexuslogin"
        ARTVERSION = "${env.BUILD_ID}"
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