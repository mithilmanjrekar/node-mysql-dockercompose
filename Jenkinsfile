pipeline { 
  agent any

  environment {
    DOCKERHUB = credentials('dockerhubcredentials')
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

            withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhubcredentials',
              usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {

                  sh 'echo uname=$USERNAME pwd=$PASSWORD'
                  sh "docker login -u $USERNAME -p $PASSWORD"
            }
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