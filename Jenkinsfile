pipeline {
    agent { label 'dev' }
    environment {
        Sample_creds = credentials('kanth')  // Using credentials securely
    }
    stages {
        stage('checkout') {             
            steps {
                // Use 'dir' to change the working directory for the entire block
                dir('/home/ubuntu/apache-tomcat-10.1.34/webapps') {
                    // Now you're in the correct directory, perform actions
                    sh '''#!/bin/bash
                    sleep 5
                    # List files in the current directory (webapps)
                    ls

                    # Download WAR file using credentials
                    curl -L -u "${Sample_creds_USR}:${Sample_creds_PSW}" -O "http://3.111.245.100:8082/artifactory/hello_world_war-libs-release/com/efsavage/hello-world-war/1.0.14/hello-world-war-1.0.14.war"
                    '''
                }
                
                // Now switch to the Tomcat 'bin' directory
                dir('/home/ubuntu/apache-tomcat-10.1.34/bin') {
                    // Shutdown Tomcat
                    sh './shutdown.sh'
                    sleep 3

                    // Start Tomcat
                    sh './startup.sh'
                    sleep 3
                }
            }
        }
    }
}
