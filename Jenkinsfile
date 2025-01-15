pipeline {
    agent { label 'dev' }
    environment {
       Sample_creds = credentials('kanth') // This retrieves your credentials securely
    }
    stages {
        stage('checkout') {             
            steps {
                sh '''#!/bin/bash
                sleep 5
                cd /opt/apache-tomcat-10.1.34/webapps
                ls
                
                # Download WAR file using credentials
                curl -L -u "${Sample_creds_USR}:${Sample_creds_PSW}" -O "http://3.111.245.100:8082/artifactory/hello_world_war-libs-release/com/efsavage/hello-world-war/1.0.14/hello-world-war-1.0.14.war"
                
                # Shutdown Tomcat
                cd /opt/apache-tomcat-10.1.34/bin
                ./shutdown.sh
                sleep 3
                
                # Start Tomcat
                ./startup.sh
                sleep 3
                '''
            }
        }
    }
}
