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

    stage('Test') {
            steps {
                script {
                    sh 'chmod +x scripts/test.sh'
                    sh './scripts/test.sh'
                }
          }
     }
    
    stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t DevOps_CICD_Victor_Gonzalez .'
                }
            }
    }

    stage('Publish') {
            steps {
                script {
                    docker.withRegistry('', 'dockerhub-id'){
                      docker.image("${registry}:latest").push('latest')
                    }
                }
            }
        }
    
    
  }
  environment {
    registry = 'vmga00/flask-app'
  }
}
