pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Reagan-m/backend.git',
                    credentialsId: 'github-credentials'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t backend-app .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                if [ $(docker ps -aq -f name=backend-container) ]; then
                    docker stop backend-container || true
                    docker rm backend-container || true
                fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d --name backend-container \
                -p 4040:4040 \
                --env-file .env \
                backend-app
                '''
            }
        }
    }
}

