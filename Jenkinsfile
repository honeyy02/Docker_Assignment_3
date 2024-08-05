// pipeline{
//     agent{
//         docker{
//             image 'maven:3.8.1-jdk-11'
//         }
//     }
//     stages{
//         stage('Checkout scm'){
//             steps{
//                 checkout scm
//             }
//         }
//         stage('Check docker '){
//             steps{
//                 sh 'docker --version'
//             }
//         }
//         stage('Build the maven project'){
//             steps{
//                 sh 'mvn clean package'
//             }
//         }
//         stage('Build the docker image'){
//             steps{
//                 sh 'docker build -t maven-app .'
//             }
//         }
//         stage('Create volume'){
//             steps{
//                 sh 'docker volume create my-volume'
//             }
//         }
//         stage('Run the docker image'){
//             steps{
//                 sh 'docker run --name my-maven-app -d -p 8080:8080 -v my-volume:app/targer maven-app '
//             }
//         }
        
        
//     }
// }


pipeline{
    agent any
<<<<<<< HEAD
    stages{
        stage("Docker image"){
=======
    
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
>>>>>>> 642b4428c533f46f7f229a5f870c2235510573e5
            steps{
                sh 'docker --version'
            }
        }
<<<<<<< HEAD
=======
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
        
        
>>>>>>> 642b4428c533f46f7f229a5f870c2235510573e5
    }
}
