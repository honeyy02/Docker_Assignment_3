pipeline{
    agent any
    
    stages{
        stage('Checkout scm'){
            steps{
                checkout scm
            }
        }
        stage('Check docker '){
            agent{
                docker{
                    image 'docker:latest'
                }
            }
            steps{
                sh 'docker --version'
            }
        }
        stage('Build the maven project'){
             agent {
                docker {
                    image 'maven:3.8.1-jdk-11' // Use Maven image with JDK 11
                }
            }
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Build the docker image'){
            agent {
                docker {
                    image 'docker:latest' // Use Docker image
                    args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket
                }
            }
            steps{
                sh 'sudo docker build -t maven-app .'
            }
        }
        stage('Create volume'){
            agent {
                docker {
                    image 'docker:latest' // Use Docker image
                    args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket
                }
            }
            steps{
                sh 'sudo docker volume create my-volume'
            }
        }
        stage('Run the docker image'){
            agent {
                docker {
                    image 'docker:latest' // Use Docker image
                    args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount Docker socket
                }
            }
            steps{
                sh 'sudo docker run --name my-maven-app -d -p 8080:8080 -v my-volume:app/targer maven-app '
            }
        }
        
        
    }
}
