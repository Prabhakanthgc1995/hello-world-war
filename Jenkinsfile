pipeline {
    agent any
    environment {
       Sample_creds = credentials('kanth')
    }
       stages 
    {
        stage('checkout') {             
            steps {
                sh """
                #!/bin/bash
                sleep 5
                sudo su
                cd /root/opt/apache-tomcat-10.1.34/webapps
                ls
                curl -L -u "kanth_USR:kanth_PWD" -O "http://13.203.76.219:8082/artifactory/hello_world_war-libs-release/com/efsavage/hello-world-war/1.0.14/hello-world-war-1.0.14.war"
                pwd
                cd /root/opt/apache-tomcat-10.1.34/bin
                ./shutdown.sh
                sleep 3
                pwd
                
                pwd
                cd /root/opt/apache-tomcat-10.1.34/bin
                ./startup.sh
                sleep 3
                """ 

            }
        }
         
    }
}
