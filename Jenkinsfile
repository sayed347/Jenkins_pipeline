pipeline{
    agent any
    stages{
        stage('git chekout'){
            steps{
                git credentialsId: '03a07962-7f2c-4696-9a06-b96e7753674b', url: 'https://github.com/sayed347/Jenkins_pipeline.git'
            }
        }
        stage('Build the application') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Unit Test Execution') { 
            steps{
                sh 'mvn test'
            }
        }
        stage('Build the docker image') { 
            steps{
                sh "docker build -t 23570511/sayedtriangle:latest ."
            }
        }
         stage('Push the docker image') {
            steps{
                withCredentials([string(credentialsId: '98b6359d-2934-486f-b22c-0c66a040d389', variable: 'dockerHubPass')]) {
                    sh "docker login -u 23570511 -p $dockerHubPass  docker.io"
                }
                sh 'docker push 23570511/sayedtriangle:latest'
            } 
        }
         
    }
    
}
