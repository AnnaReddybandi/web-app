pipeline {
    agent any

    environment {
        IMAGE_NAME = 'web-app'                        // Docker image name
        DOCKER_REGISTRY = 'annareddy'                 // Your DockerHub username
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Cloning GitHub repository..."
                git branch: 'main', url: 'https://github.com/AnnaReddybandi/web-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                script {
                    docker.build("${DOCKER_REGISTRY}/${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker image to DockerHub..."
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image("${DOCKER_REGISTRY}/${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                echo "Deployment stage - add your server/Kubernetes deployment commands here"
            }
        }
    }

    post {
        always {
            echo "Cleaning workspace..."
            cleanWs()
        }
        success {
            echo "Pipeline succeeded! Docker image pushed successfully."
        }
        failure {
            echo "Pipeline failed! Check logs for errors."
        }
    }
}

