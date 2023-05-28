pipeline {
    agent any

    stages {
        stage ('Checkout Source') {
            steps {
                git url: 'https://github.com/MatheuslFavaretto/Challenge_DevOps.git', branch: 'dev_jenkins'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    def dockerImageName = "matheuslfavaretto/django_api"
                    def dockerTag = "latest"
                    def docker_user = credentials('docker_user')
                    def senha_dockerhub = credentials('senha_dockerhub')

                    sh "docker build -t ${dockerImageName}:${dockerTag} ."
                    sh "docker login -u ${docker_user} -p ${senha_dockerhub}"
                    sh "docker push ${dockerImageName}:${dockerTag}"
                }
            }
        }

        stage('Infrastructure Creation or Update') {
            steps {
                script {
                    dir('infra/aws/env/dev') {
                        sh "terraform init"
                    }
                }
            }
        }
    }
}
