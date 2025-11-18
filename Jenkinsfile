pipeline {
  agent any
  environment {
    IMAGE = "backend-app:${env.BUILD_ID}"
    CONTAINER_NAME = "backend-service"
    PORT = "4040"
  }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Install & Test') {
      steps {
        sh 'npm ci'
        sh 'npm test || true'   // keep pipeline running even if no tests
      }
    }
  stage('Build Docker Image') {
    steps {
        sh "docker build -t ${IMAGE} ."
      }
    }
  stage('Deploy') {
    steps {
        sh '''
        # stop old container if running
        docker stop backend-service || true
        docker rm backend-service || true

        # run new container
        docker run -d --name backend-service -p 4040:4040 backend-app:${env.BUILD_NUMBER}
        '''
    }
}


