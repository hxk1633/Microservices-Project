def obtainChanges(){
    result = ''
    result_new = ''
    def changeLogSets = currentBuild.changeSets
    for (int i = 0; i < changeLogSets.size(); i++) {
        def entries = changeLogSets[i].items
        for (int j = 0; j < entries.length; j++) {
            def entry = entries[j]
            echo "${entry.commitId} by ${entry.author} on ${new Date(entry.timestamp)}: ${entry.msg}"
            def files = new ArrayList(entry.affectedFiles)
            for (int k = 0; k < files.size(); k++) {
                def file = files[k]
                echo file.editType.name
                if(file.editType.name == "edit" && file.path.startsWith('microservices/services/')){
                    result = "${result}${file.path},"
                }
                if(file.editType.name == "add" && file.path.startsWith('microservices/services/')){
                    result_new = "${result_new}${file.path},"
                }
            }
        }
    }

    def tempResult = '';
    def folders = '';
    def arr = result.split(',')
    for (int j = 0; j < arr.length; j++) {
        def folderDirectory = arr[j].split('/')
        for(int k = 0; k < folderDirectory.length; k++){
            if(folderDirectory[k] == "services" && k+1 < folderDirectory.length){
                tempResult = "${tempResult}${folderDirectory[k+1]} "
            }
        }
    }
    def resultS = tempResult.tokenize(' ')
    resultS = resultS.unique()
    for(int i = 0; i < resultS.size(); i++){
        folders="${folders}${resultS[i]},"
    }
    env.folders =  "${folders}"


    def tempResult_new = '';
    def folders_new = '';
    def arr_new = result_new.split(',')
    for (int j = 0; j < arr_new.length; j++) {
        def folderDirectory_new = arr_new[j].split('/')
        for(int k = 0; k < folderDirectory_new.length; k++){
            if(folderDirectory_new[k] == "services" && k+1 < folderDirectory_new.length){
                tempResult_new = "${tempResult_new}${folderDirectory_new[k+1]} "
            }
        }
    }
    def resultS_new = tempResult_new.tokenize(' ')
    resultS_new = resultS_new.unique()
    for(int i = 0; i < resultS_new.size(); i++){
        folders_new="${folders_new}${resultS_new[i]},"
    }
    env.folders_new =  "${folders_new}"
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
            steps{
                obtainChanges()
                echo folders
                echo folders_new
            }
        }
        // stage('Microservice Build and upload Docker image'){
        //     steps{
        //         script{
        //             if(env.folders != ''){
        //                 def arr = env.folders.split(',')
        //                 for(int i = 0; i <arr.length; i++){
        //                     dir("${directory}${arr[i]}"){
        //                         echo arr[i]
        //                         dockerName = "${registry}${arr[i]}_microservice"
        //                         dockerImage = docker.build dockerName
        //                         docker.withRegistry('', registryCredential){
        //                             dockerImage.push()
        //                         }
        //                     }
        //                 }
        //             }

        //             if(env.folders_new != ''){
        //                 def arr_new = env.folders_new.split(',')
        //                 for(int i = 0; i <arr_new.length; i++){
        //                     dir("${directory}${arr_new[i]}"){
        //                         echo arr_new[i]
        //                         dockerName = "${registry}${arr_new[i]}_microservice"
        //                         dockerImage = docker.build dockerName
        //                         docker.withRegistry('', registryCredential){
        //                             dockerImage.push()
        //                         }
        //                     }
        //                 }
        //             }
        //         }
        //     }
        // }
        // stage('Microservice task'){
        //     steps{
        //         script{
        //             if(env.folders != ''){
        //                   dir("./microservices"){
        //                     flag = "edit"
        //                     sh "bash sshlogin.sh ${env.folders} ${flag}" 
        //                 }
        //             }
        //             if(env.folders_new != ''){
        //                   dir("./microservices"){
        //                     flag_new = "new"
        //                     sh "bash sshlogin.sh ${env.folders_new} ${flag_new}" 
        //                 }
        //             }
        //         }
        //     }
        // }
        // stage('Monolithic detect changes, build ,and push images'){
        //     when{
        //         changeset "monolithic-app/*"
        //     }
        //     steps{
        //         script{
        //             dir("monolithic-app"){
        //                 dockerImage = docker.build registry_mono
        //                 docker.withRegistry('', registryCredential){
        //                             dockerImage.push()
        //                 }
        //             }
        //         }
        //     }
        // }
        // stage('Monolithic task'){
        //     when{
        //         changeset "monolithic-app/*"
        //     }
        //     steps{
        //         dir("monolithic-app"){
        //             sh "bash sshlogin.sh"
        //         }
        //     }
        // }
    }
}
