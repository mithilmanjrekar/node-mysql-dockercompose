node {
  try {
    stage('checkout') {
      checkout scm
    }
    stage('prepare') {

       app = docker.build("getintodevops/hellonode")

    }
    stage('compile') {

        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("2")
            app.push("latest")
        }

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