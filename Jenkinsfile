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
      sh("docker -v")

      sh("echo '172.21.32.12' | docker secret create mysql_root_host -")
      sh("echo 'root' | docker secret create mysql_user -")
      sh("echo 'rootroot' | docker secret create mysql_password -")
      sh("echo 'testnpm' | docker secret create mysql_database -")

      sh("docker stack deploy -c docker-compose-stack.yml dragsters_overlay")

      sh("docker stack ls")

      sh("docker stack rm dragsters_overlay")


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