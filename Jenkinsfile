pipeline {
    agent any
    environment {     
       DOCKERHUB_CREDENTIALS= credentials('dockerhub')     
   } 
    stages {
        stage('Build and Push') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                 
	            echo 'Login Completed'

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
