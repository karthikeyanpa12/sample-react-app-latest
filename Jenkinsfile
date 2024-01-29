pipeline {
    agent any
    environment {     
       DOCKERHUB_CREDENTIALS= credentials('dockerhub')     
   } 
    stages {
        stage('Build and Push') {
            steps {
		  script {
                    // Define the credentials ID associated with your Docker Hub credentials
                    def dockerHubCredentialsId = 'dockerhub'

                    // Use the 'withCredentials' step to securely access the credentials
                    withCredentials([usernamePassword(credentialsId: dockerHubCredentialsId, usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Within this block, DOCKER_USERNAME and DOCKER_PASSWORD are available
                        def dockerUsername = env.DOCKER_USERNAME
                        def dockerPassword = env.DOCKER_PASSWORD

                        // Use dockerUsername and dockerPassword in your Docker commands
                        sh "docker login -u ${dockerUsername} -p ${dockerPassword}"
			sh 'docker build -t react-app-react-app .'
                        sh 'docker tag react-app-react-app  karthikeyanpa/dev:2.0'
                        sh 'docker push karthikeyanpa/dev:2.0'
                        // Additional Docker-related commands here
                    }
		  }
             //    sh 'echo $DOCKERHUB_CREDENTIALS_PSW |  sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
	            // echo 'Login Completed'
		    // echo $DOCKERHUB_CREDENTIALS

                // script {
                //     if (env.BRANCH_NAME == 'dev') {
                //         echo "Building and pushing to the dev repository on Docker Hub"
                //         sh 'docker build -t my-react-app-dev .'
                //         sh 'docker login -u karthikeyanpa -p your-docker-hub-password'
                //         sh 'docker tag your-dev-image:latest karthikeyanpa/dev-repo:latest'
                //         sh 'docker push your-docker-hub-username/dev-repo:latest'
                //     } else if (env.BRANCH_NAME == 'master') {
                //         echo "Building and pushing to the prod repository on Docker Hub"
                //         sh 'docker build -t your-prod-image .'
                //         sh 'docker login -u karthikeyanpa -p your-docker-hub-password'
                //         sh 'docker tag your-prod-image:latest karthikeyanpa/prod-repo:latest'
                //         sh 'docker push your-docker-hub-username/prod-repo:latest'
                //     } else {
                //         echo "Branch not configured for deployment"
                //     }
                // }
            }
        }
        
        // stage('Deploy') {
        //     steps {
        //         script {
        //             if (env.BRANCH_NAME == 'dev') {
        //                 echo "Deploying to the dev environment"
        //                 // Add your deployment steps for the dev environment here
        //             } else if (env.BRANCH_NAME == 'master') {
        //                 echo "Deploying to the prod environment"
        //                 // Add your deployment steps for the prod environment here
        //             }
        //         }
        //     }
        // }
    }
    
    post {
        failure {
            echo "Build and deployment failed"
            // You can add additional failure handling steps here
        }
    }
}
