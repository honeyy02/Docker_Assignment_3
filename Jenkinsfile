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

    }
}