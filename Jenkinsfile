pipeline { 
  agent any

  environment {
    CI        = 'true' 
  }
  
  stages {

    stage ('Checkout Code') {
        steps {
           
            sh "which git"
            checkout scm
            echo "Checked git branch."
        }
    }

    stage('Dockerhub Login') {
        steps {

            withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhubcredentials',
              usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {

                  sh 'echo uname=$USERNAME pwd=$PASSWORD'
                  sh "docker login -u $USERNAME -p $PASSWORD"
                  echo "Logged in into docker."
            }

        }
    }

    stage('Docker Build Image') {
        steps {

              sh 'env'
              sh "docker build -t mithilmnjrkr/nodeapp ."
              echo "Build docker image from Dcokerfile."

        }
    }

    stage('Docker Push') {
        steps {

              sh 'env'
              sh "docker push mithilmnjrkr/nodeapp"
              echo "Successfully pushed image to the docker registry."

        }
    }

    stage ('Docker Build App Stack') {
        steps {

              sh "docker stack deploy -c docker-stack.yml dragsters_app"
              sh "docker stack ls"
              echo "Successfully running docker stack with no faliures."
              sh "docker stack rm dragsters_app"
              echo "Removed docker stack."

        }
    }
    
    stage('Docker Swarm Test') {
        steps {
          
              echo "Docker Swarm Test"
          
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
