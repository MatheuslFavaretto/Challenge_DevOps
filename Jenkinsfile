pipeline {
    agent any
    environment {
        docker_user = credentials('docker_user')
        senha_dockerhub = credentials('senha_dockerhub')
    }
    stages {
        stage('Checkout Source') {
            steps {
                git url: 'https://github.com/MatheuslFavaretto/Challenge_DevOps.git', branch: 'dev_jenkins'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t matheuslfavaretto/django_api:latest ."
                    sh "docker login -u ${docker_user.username} -p ${senha_dockerhub.password}"
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh "docker login -u ${docker_user.username} -p ${senha_dockerhub.password}"
            }
        }

        stage('Infrastructure Creation or Update') {
            steps {
                script {
                    dir('infra/aws/env/dev') {
                        sh 'terraform init'
                    }
                }
            }
        }
    }
}
