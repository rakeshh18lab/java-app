pipeline {
    agent any
 
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO  = '757897967941.dkr.ecr.us-east-1.amazonaws.com/my-app'
    }
 
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/rakeshh18lab/java-app.git'
            }
        }
 
        stage('Build with Maven') {
            steps {
                sh 'mvn clean install'
            }
        }
 
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-app:latest .'
            }
        }
 
        stage('Login to Amazon ECR') {
            steps {
                withAWS(region: "${AWS_REGION}", credentials: 'aws-creds') {
                    sh '''
                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${ECR_REPO}
                    '''
                }
            }
        }
 
        stage('Push Docker Image to ECR') {
            steps {
                sh '''
                docker tag my-app:latest ${ECR_REPO}:latest
                docker push ${ECR_REPO}:latest
                '''
            }
        }
    }
}
