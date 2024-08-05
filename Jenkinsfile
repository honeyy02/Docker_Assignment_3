pipeline{
    agent{
        docker{
            image 'maven:3.8.1-jdk-11'
        }
    }
    stages{
        stage('Checkout scm'){
            steps{
                checkout scm
            }
        }
        stage('Check docker '){
            steps{
                sh 'docker --version'
            }
        }
        stage('Build the maven project'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Build the docker image'){
            steps{
                sh 'docker build -t maven-app .'
            }
        }
        stage('Create volume'){
            steps{
                sh 'docker volume create my-volume'
            }
        }
        stage('Run the docker image'){
            steps{
                sh 'docker run --name my-maven-app -d -p 8080:8080 -v my-volume:app/targer maven-app '
            }
        }
        
        
    }
}
