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
                    withCredentials([usernamePassword(credentialsId: 'dockerHubCredentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                        sh 'docker push vmga00/devops_cicd_victor_gonzalez:latest'
                    }
                }
            }
        }
    
    
  }
  environment {
    registry = 'vmga00/flask-app'
  }
}
