node {
  try {
    stage('checkout') {
      checkout scm
    }
    stage('prepare') {

       app = docker.build("nodeapp")

    }
    stage('compile') {
      
      sh("start-docker-swarm-stack.sh")

    }
    stage('test') {
      echo "doing some cleanup..."
    }
    stage('package') {
      echo "doing some cleanup..."
    }
    stage('publish') {
      echo "doing some cleanup..."
    }
  } finally {
    stage('cleanup') {
      echo "doing some cleanup..."
    }
  }
}