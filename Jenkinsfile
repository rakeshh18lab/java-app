pipeline {
    agent any
 
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = '757897967941.dkr.ecr.us-east-1.amazonaws.com/my-app'  
    }
 
    stages {
        stage('Checkout Code') {
            steps {
               git branch: 'main', url:'https://github.com/rakeshh18lab/java-app.git'
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
                sh '''
                aws ecr get-login-password --region us-east-1 | \
                docker login --username AWS --password-stdin 757897967941.dkr.ecr.us-east-1.amazonaws.com/my-app
                '''
            }
        }
 
        stage('Push Docker Image to ECR') {
            steps {
                sh 'docker tag my-app:latest 757897967941.dkr.ecr.us-east-1.amazonaws.com/my-app:latest'
                sh 'docker push 757897967941.dkr.ecr.us-east-1.amazonaws.com/my-app:latest'
            }
        }
    }
}
