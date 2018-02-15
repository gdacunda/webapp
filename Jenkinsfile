pipeline {
	tools {
		maven 'apache-maven-3.5.2'
	}
    environment {
        IMAGE_NAME = "gdacunda/webapp"
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
                sh "docker build -t ${IMAGE_NAME} ."                 
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

