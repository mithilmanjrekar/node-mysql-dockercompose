pipeline {
    agent any

    environment { 
        CI = 'true'
    }
    
    stages {
        stage('Initialize') {
         
                echo 'Initializing...'
                echo 'Do all the initail steps check if git and docker is installed.'
         
        }

        stage('Checkout') {
            
                echo 'Getting source code...'
                checkout scm
            
        }
        stage('Build') {
            steps {
                
                echo 'Building dependencies...'
                sh './start-docker-webapp.sh'
  
            }
        }
        stage('Test') {
            steps {
                
                echo 'Testing...'
                sh './test_webapp.sh'
          
                    
            }
        }
        stage('Deliver') { 
            steps {
                
                echo 'Pushing app to staging/production...'
                sh './deliver_webapp.sh'
                
            }
        }
    }
}
