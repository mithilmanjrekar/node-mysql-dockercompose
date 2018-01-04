node {
  try {
    stage('checkout') {
      checkout scm
    }
    stage('Build Image.') {

       nodeapp = docker.build("mithilmnjrkr/nodeapp")

    }
    stage('Push to Registry.') {

      sh("docker push mithilmnjrkr/nodeapp")
    
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