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
        // stage("Build the project"){
        //     agent {
        //         docker{
        //             image 'maven:3.8.1-jdk-11'
        //         }
        //     }
        //     steps{
        //         sh 'mvn clean package'
        //     }
        // }
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
        stage("Run the image with container"){
            steps{
                script{
                    sh 'docker run --name my-maven-appV2 -d -p 8081:8080 -v my-volume:/app/target maven-app'
                }
            }
        }
        stage("Copy volume to Jenkins workspace") {
            steps {
                script {
                    // Create a temporary container to access the volume
                    sh 'docker run --rm -v my-volume:/volume -v $WORKSPACE:/workspace alpine sh -c "cp -r /volume/* /workspace/"'
                }
            }
        }

    }
}