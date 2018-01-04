node {
  try {
    stage('checkout') {
      checkout scm
    }
    stage('Build Image.') {

       app = docker.build("nodeapp")

    }
    stage('Push to Registry.') {

      echo "Here if the build is successfull the image will be pushed to remote registry."
    
    }
    stage('Stack Deploy Test') {
      
      sh("docker -v")

      sh("docker stack deploy -c docker-compose-stack.yml dragsters_overlay")

      sh("docker stack ls")

      sh("docker stack rm dragsters_overlay")
    
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