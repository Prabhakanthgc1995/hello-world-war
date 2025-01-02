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
                }
            }
        }
    }
}
