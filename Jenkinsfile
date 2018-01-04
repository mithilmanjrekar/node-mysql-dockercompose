pipeline {
  agent none
  stages {
    stage('Test Stage') {
      agent {
        docker {
          image 'node:8.9.1'
        }
      }
      steps {
        sh 'node -v'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t shanem/spring-petclinic:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
  
        }
      }
    }
  }
}