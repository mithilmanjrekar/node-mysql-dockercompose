node {
  try {
    stage('checkout') {
      checkout scm
    }
    stage('prepare') {
      sh "docker -v"
    }
    stage('compile') {
      echo "doing some cleanup..."
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