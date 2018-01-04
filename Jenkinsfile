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
    stage ('Build App') {
          steps {


              sh "echo Add build commands here"

          }
    }
    stage('Dockerhub Login') {
          steps {
             
              withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhubcredentials',
                usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASSWORD']]) {

                    sh 'echo uname=$DOCKERHUB_USER pwd=$DOCKERHUB_PASSWORD'
                    sh "docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASSWORD"

              }
          }
    }
    stage('Docker build') {
        steps {

          sh 'env'
          sh "docker build -t $DOCKERHUB_USER/${env.JOB_NAME}:${env.GIT_BRANCH}-${env.BUILD_NUMBER} ."
          sh "docker ps"

        }

    }
    stage('Docker push') {
        steps {
            sh 'env'
            sh "docker push $DOCKERHUB_USR/${env.JOB_NAME}:${env.GIT_BRANCH}-${env.BUILD_NUMBER}"
          sh "curl -k http://${env.ST2_URL}/api/v1/webhooks/codecommit -d '{\"name\": \"${env.JOB_NAME}\", \"build\": {\"branch\": \"${env.GIT_BRANCH}\", \"status\": \"SUCCESS\", \"number\": \"${env.BUILD_ID}\"}}' -H 'Content-Type: application/json' -H 'st2-api-key: ${env.ST2_API_KEY}'"
          sh "sudo docker rmi $DOCKERHUB_USR/${env.JOB_NAME}:${env.GIT_BRANCH}-${env.BUILD_NUMBER}"
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