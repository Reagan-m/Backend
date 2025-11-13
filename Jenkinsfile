pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Reagan-m/Backend.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t backend-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f backend-container || true
                docker run -d -p 5000:5000 --name backend-container backend-app
                '''
            }
        }
    }
}

