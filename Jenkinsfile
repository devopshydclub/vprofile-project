pipeline{
    agent any
    tools{
        maven "M3"
        jdk "JDK11"

    environment{
        NEXUS-USER = "admin"
        NEXUS-PASS = "admin"
        NEXUS_VERSION = "admin"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "4.240.74.220/:8081"
        NEXUS_REPOSITORY = "vprofile-release"
	    NEXUS_REPO_ID  = "vprofile-release"
        CENTRAL-REPO = "vpro-maven-central"
        NEXUS-GRP-REPO = "vpro-maven-group" 
        NEXUS_CREDENTIAL_ID = "nexuslogin"
        SNAP-REPO = "vprofile-snapshot"
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