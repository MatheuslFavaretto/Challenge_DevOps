pipeline {
    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git url: 'https://github.com/MatheuslFavaretto/Challenge_DevOps.git', branch: 'dev_jenkins'
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
