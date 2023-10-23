pipeline {
  agent any
  stages {
    stage('Clean Workspace') {
      steps {
        deleteDir()
      }
    }

    stage('Checkout'){
      steps{
        script{
          checkout scm
        }
      }
    }

    stage('Check Code Quality') {
          steps {
              script {
                  docker.image('arm64v8/node:21').inside{
                      sh'''
                        mkdir -p /opt/app/tmp
                      '''
                      dir('/opt/app/tmp'){
                        sh'''
                          npm install eslint stylelint htmlhint --unsafe-perm
                          eslint 'src/**/*.js'
                          stylelint 'src/**/*.css'
                          htmlhint 'public/**/*.html'
                        '''
                      }
                  }
              }
       }
    }

    stage('Build') {
      steps {
        script {
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
