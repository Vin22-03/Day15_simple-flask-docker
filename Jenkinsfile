pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_URL = '921483785411.dkr.ecr.us-east-1.amazonaws.com/day15-flask-ecr'
        ECS_CLUSTER = 'vin-flask-cluster'
        ECS_SERVICE = 'vin-flask-service'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Vin22-03/Day15_simple-flask-docker.git'
            }
        }

        stage('Login to ECR & Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-ecr-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    sh '''
                        aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                        aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                        aws configure set default.region $AWS_REGION
                        
                        aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ECR_URL

                        docker build -t day15-flask-ecr .
                        docker tag day15-flask-ecr:latest $ECR_URL:latest
                        docker push $ECR_URL:latest
                    '''
                }
            }
        }

        stage('Update ECS Service') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-ecr-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    sh '''
                        aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                        aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                        aws configure set default.region $AWS_REGION

                        aws ecs update-service \
                          --cluster $ECS_CLUSTER \
                          --service $ECS_SERVICE \
                          --force-new-deployment \
                          --region $AWS_REGION
                    '''
                }
            }
        }
    }
}
