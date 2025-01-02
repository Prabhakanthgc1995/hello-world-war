pipeline {
    agent { label 'production' }

    stages {
        stage('Checkout') {
            steps {
                // Clean up any previous clone and clone the repository
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/Prabhakanthgc1995/hello-world-war.git'
            }
        }

        stage('Build') {
            steps {
                // Run Maven build inside the cloned repository directory
                dir('hello-world-war') {
                    sh 'mvn clean package'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def tomcatWebapps = '/home/ubuntu/apache-tomcat-10.1.34/webapps'
                    def warFile = '/home/ubuntu/hello-world-war/target/hello-world-war-1.0.0.war'
                    
                    // Ensure the Tomcat webapps directory exists
                    sh "mkdir -p ${tomcatWebapps}"

                    // Copy the generated WAR file to the Tomcat webapps directory
                    sh "cp ${warFile} ${tomcatWebapps}/"

                    // Ensure shutdown.sh and startup.sh are executable
                    sh 'chmod +x /home/ubuntu/apache-tomcat-10.1.34/bin/shutdown.sh'
                    sh 'chmod +x /home/ubuntu/apache-tomcat-10.1.34/bin/startup.sh'

                    // Stop Tomcat using shutdown.sh
                    sh '/bin/bash /home/ubuntu/apache-tomcat-10.1.34/bin/shutdown.sh'
                    
                    // Adding a small sleep to ensure Tomcat has stopped
                    sleep(10)  // You can increase the sleep time if needed

                    // Start Tomcat using startup.sh
                    sh '/bin/bash /home/ubuntu/apache-tomcat-10.1.34/bin/startup.sh'
                }
            }
        }
    }
    
    post {
        success {
            echo 'Deployment to Tomcat was successful.'
        }
        failure {
            echo 'There was an issue with the pipeline.'
        }
    }
}
