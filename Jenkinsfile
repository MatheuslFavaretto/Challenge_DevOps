pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_USERNAME = credentials('DOCKERHUB_USERNAME')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
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
                    sh 'sudo docker build -t matheuslfavaretto/django_api:latest .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'sudo docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'sudo docker push matheuslfavaretto/django_api:latest'
                }
            }
        }

        stage('Infrastructure Creation or Update') {
            steps {
                script {
                    dir('infra/aws/env/dev/') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Infrastructure Destroy') {
            steps {
                script {
                    dir('infra/aws/env/dev/') {
                        sh 'terraform init'
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
