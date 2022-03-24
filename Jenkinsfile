def loop_func(values){
    for (int i=0; i<values.size();i++) {
        echo "values[i]"
        }
}
pipeline{
    
    agent any
    
    
    environment{
        dockerImage = ''
        registry1 = 'jh7939/microservices:comments_microservice' 
        registry2 = 'jh7939/microservices:posts_microservice' 
        registry3 = 'jh7939/microservices:threads_microservice'
        registry4 = 'jh7939/microservices:users_microservice'
        registry5 = 'jh7939/microservices:my-haproxy'
        registryCredential = 'dockerhub_id'
    }
    
    stages{
        stage('Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hxk1633/Microservices-Project']]])
 
          
            }
        }
        stage('Detect new folder'){
            steps{
                script{
                    dir("./microservices"){
                        GIT_COMMIT = sh (
                            script: 'bash helper.sh',
                            returnStdout: true
                        ).trim()
                        def v = "${GIT_COMMIT}".split('\n')
                        loop_func(v)
                    }
                }

            }
        }
        // stage('Build Docker image'){
        //     when {
        //         changeset "microservices/services/comments/*"
        //     }
        //     steps{
        //         script{
        //             dir('./microservices/services/comments'){
        //                 dockerImage = docker.build registry1
        //              }
        //         }
        //     }
        // }
        
        // stage("Uploading Image"){
        //     when {
        //         changeset "microservices/services/comments/*"
        //     }
        //     steps{
        //         script{
        //                 docker.withRegistry('', registryCredential){
        //                     dockerImage.push()
        //             }
        //         }
        //     }
        // }

        // stage('Checkout2'){
        //     steps{
        //         checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hxk1633/Microservices-Project']]])
 
          
        //     }
        // }
        // stage('Build Docker image2'){
        //     when {
        //         changeset "microservices/services/posts/*"
        //     }
        //     steps{
        //         script{
        //             dir('./microservices/services/posts'){
        //                 dockerImage = docker.build registry2
        //              }
        //         }
        //     }
        // }
        
        // stage("Uploading Image2"){
            
        //     when {
        //         changeset "microservices/services/posts/*"
        //     }
        //     steps{
        //         script{
        //                 docker.withRegistry('', registryCredential){
        //                     dockerImage.push()
        //             }
        //         }
        //     }
        // }
        
        // stage('Checkout3'){
        //     steps{
        //         checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hxk1633/Microservices-Project']]])
 
          
        //     }
        // }
        // stage('Build Docker image3'){
            
        //     when {
        //         changeset "microservices/services/threads/*"
        //     }
        //     steps{
        //         script{
        //             dir('./microservices/services/threads'){
        //                 dockerImage = docker.build registry3
        //              }
        //         }
        //     }
        // }
        
        // stage("Uploading Image3"){
            
        //     when {
        //         changeset "microservices/services/threads/*"
        //     }
        //     steps{
        //         script{
        //                 docker.withRegistry('', registryCredential){
        //                     dockerImage.push()
        //             }
        //         }
        //     }
        // }
        
        // stage('Checkout4'){
        //     steps{
        //         checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hxk1633/Microservices-Project']]])
 
          
        //     }
        // }
        // stage('Build Docker image4'){
        //     when {
        //         changeset "microservices/services/users/*"
        //     }
        //     steps{
        //         script{
        //             dir('./microservices/services/users'){
        //                 dockerImage = docker.build registry4
        //              }
        //         }
        //     }
        // }
        
        // stage("Uploading Image4"){
            
        //     when {
        //         changeset "microservices/services/users/*"
        //     }
        //     steps{
        //         script{
        //                 docker.withRegistry('', registryCredential){
        //                     dockerImage.push()
        //             }
        //         }
        //     }
        // }
        
        // stage('Checkout5'){
        //     steps{
        //         checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hxk1633/Microservices-Project']]])
          
        //     }
        // }
        // stage('Build Docker image5'){
            
        //     when {
        //         changeset "microservices/haproxy/*"
        //     }
        //     steps{
        //         script{
        //             dir('./microservices/haproxy'){
        //                 dockerImage = docker.build registry5
        //              }
        //         }
        //     }
        // }
        
        // stage("Uploading Image5"){
            
        //     when {
        //         changeset "microservices/haproxy/*"
        //     }
        //     steps{
        //         script{
        //                 docker.withRegistry('', registryCredential){
        //                     dockerImage.push()
        //             }
        //         }
        //     }
        // }

        // stage("swap threads containers"){
        //     when{
        //             changeset "microservices/services/threads/*"  
        //         }           
        //     steps{
        //         script{
        //             dir("./microservices"){
        //                 sh 'bash sshlogin.sh threads'
        //                 // sh 'bash update_containers.sh threads 4'
        //             }
        //         }
        //     }
        // }

        // stage("swap posts containers"){
        //     when{
        //             changeset "microservices/services/posts/*"  
        //         }           
        //     steps{
        //         script{
        //             dir("./microservices"){
        //                 sh 'bash sshlogin.sh posts'
        //                 // sh 'bash update_containers.sh posts 4'
        //             }
        //         }
        //     }
        // }

        // stage("swap users containers"){
        //     when{
        //             changeset "microservices/services/users/*"  
        //         }           
        //     steps{
        //         script{
        //             dir("./microservices"){
        //                 sh 'bash sshlogin.sh users'
        //                 // sh 'bash update_containers.sh users 4'
        //             }
        //         }
        //     }
        // }

        // stage("swap comments containers"){
        //     when{
        //             changeset "microservices/services/comments/*"  
        //         }           
        //     steps{
        //         script{
        //             dir("./microservices"){
        //                 sh 'bash sshlogin.sh comments'
        //                 // sh 'bash update_containers.sh comments 4'
        //             }
        //         }
        //     }
        // }
    }
}
