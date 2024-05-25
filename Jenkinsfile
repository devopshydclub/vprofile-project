pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK11"
    }

    environment {
        NEXUS_USER = "admin"
        NEXUS_PASS = "admin"
        NEXUS_VERSION = "admin"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "4.240.74.220:8081"
        NEXUSIP = "4.240.74.220"
        NEXUSPORT = "8081"
        NEXUS_REPOSITORY = "vprofile-release"
	    NEXUS_REPO_ID  = "vprofile-release"
        CENTRAL_REPO = "vpro-maven-central"
        NEXUS_GRP_REPO = "vpro-maven-group" 
        NEXUS_CREDENTIAL_ID = "nexuslogin"
        SNAP_REPO = "vprofile-snapshot"
        ARTVERSION = "${env.BUILD_ID}"

    }
    stages{
        stage("TEST"){
            steps{
                sh(script: 'mvn -s settings.xml -DskipTests install')
                sh(script: 'mvn package')
                sh(script: 'mvn deploy')
            }
        }
    }
}