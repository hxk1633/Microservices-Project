def obtainChanges(){
    result = ''
    def changeLogSets = currentBuild.changeSets
    for (int i = 0; i < changeLogSets.size(); i++) {
        def entries = changeLogSets[i].items
        for (int j = 0; j < entries.length; j++) {
            def entry = entries[j]
            echo "${entry.commitId} by ${entry.author} on ${new Date(entry.timestamp)}: ${entry.msg}"
            def files = new ArrayList(entry.affectedFiles)
            for (int k = 0; k < files.size(); k++) {
                def file = files[k]
                if(file.editType.name != "delete" && file.path.startsWith('microservices/services/')){
                    result = "${result}${file.path},"
                    // ${file.editType.name} 
                }
            }
        }
    }
    def tempResult = '';
    def folders = '';
    def arr = result.split(',')
    for (int j = 0; j < arr.length; j++) {
        def folderDirectory = arr[j].split('/')
        tempResult = "${tempResult}${folderDirectory[folderDirectory.length-2]} "
    }
    def resultS = tempResult.tokenize(' ')
    resultS = resultS.unique()
    for(int i = 0; i < resultS.size(); i++){
        folders="${folders}${resultS[i]},"
    }
    echo folders
    env.folders =  "${folders}"
}

pipeline{
    
    agent any
    
    
    environment{
        dockerImage = ''
        directory = './microservices/services/'
        registry = 'jh7939/microservices:'
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
                obtainChanges()
            }
        }
        stage('Microservice Build and upload Docker image'){
            steps{
                script{
                    def arr = env.folders.split(',')
                    for(int i = 0; i <arr.length; i++){
                        dir("${directory}${arr[i]}"){
                            echo arr[i]
                            dockerName = "${registry}${arr[i]}_microservice"
                            dockerImage = docker.build dockerName
                            docker.withRegistry('', registryCredential){
                                dockerImage.push()
                            }
                        }
                    }
                }
            }
        }
        stage('Microservice task'){
            steps{
                script{
                    def folderNames = env.folders.split(',')
                    dir("./microservices"){
                        for(int i = 0; i < folderNames.length; i++){
                            sh "bash sshlogin.sh ${folderNames[i]}"
                        }
                    }
                }
            }
        }
    }
}
