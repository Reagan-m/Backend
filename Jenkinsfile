pipeline {
    agent any

    environment {
        IMAGE_NAME = "backend-app"
        CONTAINER_NAME = "backend-container"
    }

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
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                if [ "$(docker ps -aq -f name=${CONTAINER_NAME})" ]; then
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d --env-file .env --name ${CONTAINER_NAME} -p 4050:4050 --link mongo:mongo ${IMAGE_NAME}'
            }
        }
    }
}

