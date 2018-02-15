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
                
                image_name = "gdacunda/webapp"
                tagged_image_name = "${image_name}:${env.BUILD_ID}"
                
                sh "docker build -t ${tagged_image_name} ."                 
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

