pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                bat 'dotnet build WebApiTest.sln -p:Configuration=release -v:q'
            
                bat 'echo deleted workspace'
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
