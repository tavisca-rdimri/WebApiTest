pipeline {
    agent any
    stages {
        stage('build') {
            steps {
		    sh 'export PATH=/usr/local/share/dotnet:$PATH'
                sh '/usr/local/share/dotnet/dotnet build WebApiTest.sln -p:Configuration=release -v:q'
            }
        }
		
		
		
        stage('publish') {
            steps {
                sh '/usr/local/share/dotnet/dotnet publish WebApiTest.sln -p:Configuration=release -v:q'
            }
        }
		
		stage ('BuildDockerImage')
        {
            steps {
                sh 'docker build -t aspnetapp -f Dockerfile .'
            }
        }
		
		 stage('SonarQube stage') {
        	
        	steps{
        		echo 'Docker run the image pulled from dockerhub'
				sh '/usr/local/share/dotnet/dotnet C:/Users/rdimri/Downloads/sonarqube-7.9.1/SonarScanner.MSBuild.dll begin /d:sonar.login=admin /d:sonar.password=admin /k:"8daa1a472bb80daf4e8437f6577583fb13887c40"'
				sh '/usr/local/share/dotnet/dotnet build'
				sh '/usr/local/share/dotnet/dotnet C:/Users/rdimri/Downloads/sonarqube-7.9.1/SonarScanner.MSBuild.dll end /d:sonar.login=admin /d:sonar.password=admin'
        	}
        }
		
		stage('Login to Docker')
        {
            steps{
                sh 'docker login -u rdimri -p regno@123'
            }
        }
		
		stage('Tag and Push image to Docker')
        {
            steps{
                    
                    sh 'docker tag aspnetapp:latest rdimri/webapitest:latest'
                    sh 'docker push rdimri/webapitest:latest'
            }
        }
		
		stage('Remove local docker image')
        {
            steps{
                    sh 'docker rmi aspnetapp'
            }
        }
		
		stage('Pull docker image')
        {
            steps{
                    sh 'docker pull rdimri/webapitest:latest'
            	 }
        }
		
		stage('Run docker image')
        {
            steps{
                    sh 'docker run -p 8990:8990 --name webapicontainer rdimri/webapitest'
				 }
        }
		
		
		
		
    }
	post
    { 
        always
        { 
            sh 'docker stop webapicontainer'
            sh 'docker rm webapicontainer'
            cleanWs()
        }
    }
}
