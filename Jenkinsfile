pipeline {
    agent { label 'production' }

    stages {
        stage('Checkout') {
            steps {
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/Prabhakanthgc1995/hello-world-war.git'
            }
        }

        stage('Build') {
            steps {
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
                    sh "mkdir -p ${tomcatWebapps}"
                    sh "cp ${warFile} ${tomcatWebapps}/"
                    sh '/home/ubuntu/apache-tomcat-10.1.34/bin/shutdown.sh'
                    sh '/home/ubuntu/apache-tomcat-10.1.34/bin/startup.sh' 
                }
            }
        }
    }
}
