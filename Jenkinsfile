pipeline {
    agent { label 'production' }
           stages {
        stage('checkout') {
            steps {
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/Prabhakanthgc1995/hello-world-war.git'
            }
        }
        stage('build') {
            steps {
                dir('hello-world-war') {
                    sh 'mvn clean package'
                }
            }
          stage('deploy')
             steps {
                cp '/home/ubuntu/hello-world-war/target/hello-world-war-1.0.0.war /home/ubuntu/apache-tomcat-10.1.34/webapps/'
                
        }
    }
}
