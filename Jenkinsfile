def dockerRepoUrl = "harbor.norsys-afrique.ma"
def dockerImageName = "elearning-api"
def dockerImageTag = "${dockerRepoUrl}/agrisud/${dockerImageName}:latest"

pipeline {
   agent any
   stages {
      stage('Tests') {
         steps {
            sh("mvn clean test")
         }
      }
      stage('build') {
         steps {
            sh("mvn clean install -DskipTests")
         }
      }
      stage('Docker Build and Tag') {
         steps {
            sh("docker build -f docker/Dockerfile -t ${dockerImageName} .")
         }
      }
      stage('Push') {
         environment {
            DOCKER = credentials("naf-docker-registry")
         }
         steps {
            sh("docker tag ${dockerImageName} ${dockerImageTag}")
            sh("docker login -u $DOCKER_USR -p $DOCKER_PSW ${dockerRepoUrl}")

            sh("docker push ${dockerImageTag}")
         }
      }

   }

}