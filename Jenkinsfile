pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/AnnaReddybandi/web-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t webapp:latest .'
            }
        }

        stage('Test') {
            steps {
                // Basic test: check if image runs and responds
                sh '''
                docker run -d --name temp_webapp -p 8081:80 webapp:latest
                sleep 5
                curl -I http://localhost:8081 | grep "200 OK"
                docker stop temp_webapp
                docker rm temp_webapp
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker stop webapp || true
                docker rm webapp || true
                docker run -d --name webapp -p 80:80 webapp:latest
                '''
            }
        }
    }
}
