pipeline {
    agent none  // No global agent, we'll specify the agent in each stage

    stages {
        stage('Checkout') {
            agent {
                label 'dev'  // Run on the production node
            }
            steps {
                // Clean up any previous files and clone the Git repository
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/Prabhakanthgc1995/hello-world-war.git'
            }
        }

        stage('Build') {
            agent {
                label 'dev'  // Run on the production node
            }
            steps {
                // Run Maven build inside the cloned repository directory
                dir('hello-world-war') {
                    sh 'mvn clean package'  // Ensure Maven is installed on the node
                }
            }
        }

        stage('Deploy') {
            agent {
                label 'dev'  // Run on the production node
            }
            steps {
                // Deploy the WAR file to the Tomcat webapps folder
                sh 'scp /home/ubuntu/workspace/pipeline5/hello-world-war/target/hello-world-war-1.0.0.war ubuntu@172.31.46.95:/home/ubuntu/apache-tomcat-10.1.34/webapps/'
            }
        }
    }
}
