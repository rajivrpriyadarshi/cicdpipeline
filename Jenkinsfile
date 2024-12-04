pipeline {
	agent any

    
	tools {
	    
		jdk 'jdk17'
	}

	stages {
       stage('Pull repo')
       {
       steps
	
	    {
	    checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '552894fe-a066-4c30-8dda-413876e0f0af', url: 'https://parmuthu@github.com/parmuthu/testjenkinsrepo.git']])
	    }
       }
		stage('Build project'){
			steps 
			{
			bat 'D:/apache-maven-3.6.3-bin/apache-maven-3.6.3/bin/mvn clean install -DskipTests'
		

			}
		}

	    stage('Build docker image') {
			steps {
			  echo "Build image"
			  script
			  {
			      bat 'docker build -t parmv/cicdproject .'
			  }
			}
		}
		stage('Run docker containers') {
            steps {
                // Run Docker Compose to build and start containers
                script {
                    bat 'docker-compose up -d'
                }
                
               
            }
        }
        stage('Push image to Hub'){
            steps{
               
            // withCredentials([string(credentialsId: 'dockerid', variable: 'dockerhubpwd')]) {
               bat 'docker login -u parmv -p kavikannan@2002'
           // }
            // withCredentials([string(credentialsId: 'dockerhubid', variable: 'dockerpwd')]) {
    // some block
    //bat 'docker login -u parmv -p ${dockerpwd}'
    
//}      

                
                   bat 'docker push parmv/cicdproject'
                }
            }
        }
	}