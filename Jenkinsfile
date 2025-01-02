pipeline {
    agent { label 'production' }

    stages {
        stage('Checkout') {
            steps {
                // Clean up any previous files and clone the Git repository
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
                // Deploy the WAR file to the Tomcat webapps folder
                sh 'cp /home/ubuntu/hello-world-war/target/hello-world-war-1.0.0.war /home/ubuntu/apache-tomcat-10.1.34/webapps/'
                // Optionally, you can restart Tomcat if required
                sh '/home/ubuntu/apache-tomcat-10.1.34/bin/shutdown.sh'
                sh '/home/ubuntu/apache-tomcat-10.1.34/bin/startup.sh'
            }
        }
    }
}
