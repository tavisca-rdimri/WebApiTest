pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                bat 'dotnet build WebApiTest.sln -p:Configuration=release -v:q'
            
                bat 'echo deleted workspace'
            }
        }
		
        stage('publish') {
            steps {
                bat 'dotnet publish WebApiTest.sln -p:Configuration=release -v:q'
            }
        }
		
		stage ('BuildDockerImage')
        {
            steps {
                bat 'docker build -t aspnetapp -f Dockerfile .'
            }
        }
		
		stage('Login to Docker')
        {
            steps{
                bat 'docker login -u rdimri -p regno@123'
            }
        }
		
		stage('Tag and Push image to Docker')
        {
            steps{
                    
                    bat 'docker tag aspnetapp:latest rdimri/webapitest:latest'
                    bat 'docker push rdimri/webapitest:latest'
            }
        }
		
		stage('Remove local docker image')
        {
            steps{
                    bat 'docker rmi aspnetapp'
            }
        }
		
		stage('Pull docker image')
        {
            steps{
                    bat 'docker pull rdimri/webapitest:latest'
            	 }
        }
		
		stage('Run docker image')
        {
            steps{
                    bat 'docker run -p 8990:8990 --name webapicontainer rdimri/webapitest'
				 }
        }
		
		
    }
	post
    { 
        always
        { 
            bat 'docker stop webapicontainer'
            bat 'docker rm webapicontainer'
            cleanWs()
        }
    }
}

