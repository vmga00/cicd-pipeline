pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          checkout scm
          def customImage = docker.bluid("#{registry}:latest")
        }

      }
    }

  }
  environment {
    registry = 'vmga00/flask-app'
  }
}