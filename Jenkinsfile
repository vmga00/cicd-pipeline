pipeline {
  agent any
  stages {
    sstage('Clean Workspace') {
      steps {
        deleteDir()
      }
    }
    stage('Build') {
      steps {
        script {
          checkout scm
          def customImage = docker.build("${registry}:latest")
        }

      }
    }

  }
  environment {
    registry = 'vmga00/flask-app'
  }
}
