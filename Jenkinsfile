pipeline { 
  agent any

  environment {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhubcredentials',
              usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
       
        USERNAME_ENV = USERNAME
        PASSWORD_ENV = PASSWORD
                
    }
    DOCKERHUB = credentials('dockerhubcredentials')
    CI        = 'true' 
  }
  
  stages {
    stage ('Checkout Code') {
        steps {
            echo "yo dockerhub" + DOCKERHUB
            sh "which git"
            checkout scm
        }
    }
    stage ('Build app') {
        steps {

            sh "echo Add build commands here"

        }
    }
    stage('Dockerhub login') {
        steps {

            sh 'echo uname=USERNAME_ENV pwd=PASSWORD_ENV'
            sh "docker login -u USERNAME_ENV -p PASSWORD_ENV"

        }
    }
    stage('Docker build') {
        steps {

          sh 'env'
          sh "docker build -t mithilmnjrkr/nodeapp ."

        }
    }
    stage('Docker push') {
        steps {

            sh 'env'
            sh "docker push mithilmnjrkr/nodeapp"
            sh "docker rmi mithilmnjrkr/nodeapp"

        }
    }
  }
  post {
        always {

            echo 'Janitor Cleaning the workspace'
            deleteDir() /* clean up our workspace */

     }
  }
}