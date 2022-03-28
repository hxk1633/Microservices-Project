def obtainChanges(){
    // result = ''
    // def changeLogSets = currentBuild.changeSets
    // for (int i = 0; i < changeLogSets.size(); i++) {
    //     def entries = changeLogSets[i].items
    //     for (int j = 0; j < entries.length; j++) {
    //         def entry = entries[j]
    //         echo "${entry.commitId} by ${entry.author} on ${new Date(entry.timestamp)}: ${entry.msg}"
    //         def files = new ArrayList(entry.affectedFiles)
    //         echo "${files.size()}"
    //         for (int k = 0; k < files.size(); k++) {
    //             def file = files[k]
    //             // if(file.editType.name != "delete" && file.path.startsWith('microservices/services/')){
    //             result = "${result}${file.path}\n"
    //             // }
    //         }
    //     }
    // }

    // echo result


    def changeLogSets = currentBuild.changeSets
    for (int i = 0; i < changeLogSets.size(); i++) {
        def entries = changeLogSets[i].items
        for (int j = 0; j < entries.length; j++) {
            def entry = entries[j]
            echo "${entry.commitId} by ${entry.author} on ${new Date(entry.timestamp)}: ${entry.msg}"
            def files = new ArrayList(entry.affectedFiles)
            echo "${files.size()}"
            for (int k = 0; k < files.size(); k++) {
                def file = files[k]
                echo "  ${file.editType.name} ${file.path}"
            }
        }
    }


    // def tempResult = '';
    // def folders = '';
    // def arr = result.split(',')
    // for (int j = 0; j < arr.length; j++) {
    //     def folderDirectory = arr[j].split('/')
    //     for(int z = 0; z < folderDirectory.length; z++){
    //         if(folderDirectory[z] == "services" && z+1 < folderDirectory.length && folderDirectory[z+1] != ".DS_Store"){
    //             echo folderDirectory[z+1]
    //             tempResult = "${tempResult}${folderDirectory[z+1]} "
    //             break
    //         }
    //     }
    //     // tempResult = "${tempResult}${folderDirectory[folderDirectory.length-2]} "
    // }

    // def resultS = tempResult.tokenize(' ')
    // resultS = resultS.unique()
    // for(int i = 0; i < resultS.size(); i++){
    //     folders="${folders}${resultS[i]},"
    // }
    // echo folders
    // env.folders =  "${folders}"


    // // echo "result_new: ${result}"
    // // echo "tempResult_new: ${tempResult} "
    // echo "folders: ${folders}"

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
                script{
                    env.GIT_COMMIT_EMAIL = sh (
                        script: 'git diff --diff-filter=AM --name-only $GIT_PREVIOUS_COMMIT $GIT_COMMIT ',
                        returnStdout: true).trim()
                        echo "Git committer email: ${env.GIT_COMMIT_EMAIL}"
                }
                // obtainChanges()
                // echo folders
                // echo folders_new
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
