pipeline{
    
    agent any
    
    environment{
        dockerImage = ''
        registry1 = 'jh7939/microservices:users_microservice'
        registry2 = 'jh7939/microservices:threads_microservice'
        registry3 = 'jh7939/microservices:posts_microservice'
        registry4 = 'jh7939/microservices:comments_microservice'
        registry5 = 'jh7939/microservices:haproxy'
        registryCredential = 'dockerhub_id'
    }
    
    stages{
        stage('Checkout'){
            steps{
                    checkout([$class: 'GitSCM', branches: [[name: '*/jenkinsMicro']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hxk1633/Microservices-Project']]])
            }
        }
        stage('Build Docker image'){
            // when {
            //     changeset "haproxy/*"
            // }
            steps{
                script{
                    dir('./haproxy'){
                        dockerImage = docker.build registry5
                     }
                }
            }
        }
        
        stage("Uploading Image"){
            // when {
            //     changeset "haproxy/*"
            // }
            steps{
                script{
                        docker.withRegistry('', registryCredential){
                            dockerImage.push()
                    }
                }
            }
        }
    }
}

