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
        registry_mono = 'jh7939/monolithic:monolithic-app'
        registryCredential = 'dockerhub_id'
    }
    
    stages{
        stage('Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/hxk1633/Microservices-Project']]])
            }
        }
        stage('Microservice detect change'){
            when{
                changeset "microservices/*"
            }
            steps{
                obtainChanges()
            }
        }
        stage('Microservice Build and upload Docker image'){
            when{
                changeset "microservices/*"
            }
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
            when{
                changeset "microservices/*"
            }
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
        stage('Monolithic detect changes, build ,and push images'){
            when{
                changeset "monolithic-app/*"
            }
            steps{
                script{
                    dir("monolithic-app"){
                        dockerImage = docker.build registry_mono
                        docker.withRegistry('', registryCredential){
                                    dockerImage.push()
                        }
                    }
                }
            }
        }
        stage('Monolithic task'){
            when{
                changeset "monolithic-app/*"
            }
            steps{
                dir("monolithic-app"){
                    sh "bash sshlogin.sh"
                }
            }
        }
    }
}
