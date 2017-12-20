pipeline {
    agent any

    environment { 
        CI = 'true'
    }
    
    stages {
        stage('Initialize') {
                echo 'Initializing...'
                def node = tool name: 'Node-8.9.1', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                env.PATH = "${node}/bin:${env.PATH}"
        }

        stage('Checkout') {
                echo 'Getting source code...'
                checkout scm
        }
        stage('Build') {
            steps {
                echo 'Building dependencies...'
                sh 'docker build -t nodeapp ./'
                sh 'docker-compose up'
                sh 'docker-compose down'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                echo 'if all goes well deploy it to production.'
                #ssh produdction
                #pull the git repo in production.
                #build the docker image for noe app 'docker build -t nodeapp ./'
                #This will use the production env variables and connect to rds for database. 
                #docker-compose -f docker-compose-prodcution.yml up
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh './jenkins/scripts/kill.sh' 
            }
        }
    }
}