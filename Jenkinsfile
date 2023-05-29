pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_USERNAME = credentials('DOCKERHUB_USERNAME')
        DOCKERHUB_PASSWORD = credentials('DOCKERHUB_PASSWORD')
        ENV = "${env.BRANCH_NAME == 'master' ? 'PROD' : 'DEV'}"
        BRANCH = "${env.BRANCH_NAME}"
        Slack_toke = credentials('Slack_toke')
    }
        stage('Slack Notification Start') {
            steps {
                slackSend(
                    baseUrl: 'https://hooks.slack.com/services',
                    tokenCredentialId: 'Slack_toke',
                    channel: '#C059X8PFP42',
                    message: "Pipeline ${env.BRANCH_NAME} foi iniciada",
                    sendAsText: true
                )
            }
        }
        
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
                    sh "echo ${DOCKERHUB_PASSWORD} | sudo docker login -u ${DOCKERHUB_USERNAME} --password-stdin"
                    sh 'sudo docker push matheuslfavaretto/django_api:latest'
                }
            }
        }

        stage('Infrastructure Creation or Update') {
            steps {
                script {
                    dir(env.ENV == 'PROD' ? 'infra/aws/env/prod/' : 'infra/aws/env/dev/') {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }

        stage('Infrastructure Destroy') {
            when {
                not {
                    expression {
                        return env.ENV == 'PROD'
                    }
                }
            }
            steps {
                script {
                    dir('infra/aws/env/dev/') {
                        sh 'terraform init'
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }

        stage('Slack Notification End') {
            steps {
                slackSend(message: "Pipeline ${env.BRANCH_NAME} foi finalizada", sendAsText: true)
            }
        }
    }
}
