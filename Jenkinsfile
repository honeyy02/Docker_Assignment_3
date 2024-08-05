pipeline{
    agent any
    stages{
        stage("Check docker"){
            steps{
                sh 'docker --version'
            }
        }
        stage("Checkout"){
            steps{
            checkout scm
            }
        }
        stage("Build the docker image"){
            steps{
                script{
                    sh 'docker build -t maven-app .'
                }
            }
        }
        stage("Create volume"){
            steps{
                script{
                    sh 'docker volume create my-volume'
                }
            }
        }
        stage('Stop and Remove Container') {
            steps {
                script {
                    sh 'docker stop my-maven-appV2 || true'
                    sh 'docker rm my-maven-appV2 || true'
                }
            }
        }
        stage("Run the image with container"){
            steps{
                script{
                    sh 'docker run --name my-maven-appV2 -d -p 8081:8080 -v my-volume:/app/target maven-app'
                }
            }
        }
        

    }
}