pipeline {
  agent any
  stages {
    stage('Clean Workspace') {
      steps {
        deleteDir()
      }
    }

    stage('Build') {
      steps {
        script {
          checkout scm
          sh 'chmod +x scripts/build.sh'
          sh './scripts/build.sh'
          def customImage = docker.build("${registry}:latest")
        }

      }
    }

  }
  environment {
    registry = 'vmga00/flask-app'
  }
}
