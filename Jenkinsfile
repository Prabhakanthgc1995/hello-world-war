pipeline {
    agent none  // No global agent, we'll specify the agent in each stage

    stages {
        stage('Checkout') {
            agent {
                label 'dev'  // Run on the 'dev' node
            }
            steps {
                // Clean up any previous files and clone the Git repository
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/Prabhakanthgc1995/hello-world-war.git'
            }
        }

        stage('Build') {
            agent {
                label 'dev'  // Run on the 'dev' node
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
                label 'dev'  // Run on the 'dev' node
            }
            steps {
                // Deploy the WAR file to the Tomcat webapps folder
                sh 'scp /home/ubuntu/workspace/pipeline5/hello-world-war/target/hello-world-war-1.0.0.war ubuntu@13.201.3.149:/home/ubuntu/apache-tomcat-10.1.34/webapps/'
            }
        }
    }

    post {
        success {
            // Send email on successful pipeline execution
            emailext(
                subject: "Build Success: ${env.JOB_NAME} - ${env.BUILD_NUMBER}",
                body: "The build was successful.\n\nCheck the build details at: ${env.BUILD_URL}",
                to: "prabhakanth0811@gmail.com"
            )
        }
        failure {
            // Send email on pipeline failure
            emailext(
                subject: "Build Failure: ${env.JOB_NAME} - ${env.BUILD_NUMBER}",
                body: "The build failed.\n\nCheck the build logs at: ${env.BUILD_URL}",
                to: "prabhakanth0811@gmail.com"
            )
        }
    }
}
