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
        }
    }

    stage('Dockerhub Login') {
        steps {

            withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhubcredentials',
              usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                  sh "docker login -u $USERNAME -p $PASSWORD"
            }

        }
    }

    stage('Docker Build Image') {
        steps {

              sh 'env'
              sh "docker build -t mithilmnjrkr/nodeapp ."

        }
    }

    stage('Docker Push') {
        steps {

              sh 'env'
              sh "docker push mithilmnjrkr/nodeapp"

        }
    }

    stage ('Docker Build App Stack') {
        steps {

              sh "docker stack deploy -c docker-stack.yml dragsters_app"
              sh "docker stack ls"
              sh "docker stack rm dragsters_app"

        }
    }
    
    stage('Docker Swarm Test') {
        steps {
          
              echo "Docker Swarm Test/Deploy will come here."
          
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
