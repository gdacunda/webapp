pipeline {
	agent any
    tools {
		maven 'apache-maven-3.5.2'
	}
    environment {
        REGISTRY_AUTH = credentials("dockerhub-credentials")
        IMAGE_NAME = "${REGISTRY_AUTH_USR}/webapp"
        TAGGED_IMAGE_NAME = "${IMAGE_NAME}:${env.BUILD_ID}"
    }    
	stages {
		stage('Checkout') {
			steps {
				checkout scm
			}
		}
		stage('Build') {
			steps {
				echo 'Building...'
				sh "mvn clean install"
			}
 		}
		stage('Package') {
			steps {	
				echo 'Packaging...'
                sh "docker build -t ${TAGGED_IMAGE_NAME} ."                 
			}
 		}
        stage('Publish') {
			steps {
				echo 'Publishing...'
                sh '''
                    docker login -u=${REGISTRY_AUTH_USR} -p=${REGISTRY_AUTH_PSW}
                    docker tag ${TAGGED_IMAGE_NAME} ${IMAGE_NAME}:latest
                    docker push ${TAGGED_IMAGE_NAME}
                    docker push ${IMAGE_NAME}:latest
                '''
			}
        }         
		stage('Test') {
			steps {
				echo 'Testing...'
			}
		}
		stage('Deploy') {
			steps {
				echo 'Deploying....'
			}
		}	
	}
}

