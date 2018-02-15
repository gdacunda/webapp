pipeline {
	agent { dockerfile true }
	tools {
		maven 'apache-maven-3.5.2'
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
				def customImage = docker.build("gdacunda/webapp:${env.BUILD_ID}")
                customImage.push()
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

