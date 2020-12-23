pipeline {
    agent any
    environment{
        DOCKER_TAG = getDockerTag()
    }
    stages {
        stage('Build docker image') {
            steps {
                // builing application
                echo "building...." 
                sh "docker build . -t alef123vinicius/python-app:${DOCKER_TAG} "
            }
        }
        stage('Push on Dockerhub'){
            steps{
                withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]){
                    sh "docker login -u alef123vinicius -p ${dockerHubPwd}"
                    sh "docker push alef123vinicius/python-app:${DOCKER_TAG}"
                }
            }
        }
        stage('Test code'){
            steps {
                // testing application before updateing in cluster
                echo "Testing code" 
            }
        }
        stage('Deploy QA'){
            steps{
                // oh yeah go execute and update application
                echo "Deployment QA" 
            }
        }
        stage('Test check'){
            steps{
                // oh yeah go execute and update application
                echo "Test healthchecks" 
            }
        }
        stage('Deploy Production'){
            steps{
                // oh yeah go execute and update application
                echo "Deployment Production" 
            }
        }
    }
}
