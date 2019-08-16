pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                bat 'dotnet build WebApiTest.sln -p:Configuration=release -v:q'
            
                bat 'echo deleted workspace'
            }
        }

        stage('test') {
            steps {
                bat 'echo test'
                bat 'dotnet test XUnitTestProject1/XUnitTestProject1.csproj -p:Configiration=release -v:q'
            }
        }

         stage('deploy') {
            steps {
                bat 'dotnet WebApiTest/bin/Release/netcoreapp2.2/WebApiTest.dll'
            }
        }
    }
    post{

 
success{

 
archiveArtifacts artifacts: '**', fingerprint:true

 
bat 'dotnet WebApiTest/bin/Release/netcoreapp2.2/WebApiTest.dll'

 
}

 
}
}
