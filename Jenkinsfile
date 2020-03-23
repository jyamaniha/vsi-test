def verify() {
    stage('Check Parameters') {
        def userInput = input(
            id: 'userInput', message: "Verify Input Parameters:\n cliente: ${cliente}\n hostname:${hostname}\n domain: ${domain}\n cores: ${cores}\n memory: ${memory}\n private_subnet: ${subnet_privada}", parameters: [
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: '', name: 'Please confirm you sure to proceed']
        ])
        if(!userInput) {
            error "Build wasn't confirmed"
        }
    }
}
def deployVM(){
    stage('Initial Setups VM'){
        withCredentials([usernamePassword(credentialsId: 'ibmcloud-unique', passwordVariable: 'pass', usernameVariable: 'user')]) {
            sh 'terraform apply -var iaas_classic_username="${user}" -var ibmcloud_iaas_api_key="${pass}" -var hostname="${hostname}" -var domain="${domain}" -var cores="${cores}" -var memory="${memory}" -var private_subnet="${subnet_privada}" -auto-approve'
        }
    }
}
pipeline {
    agent any
    stages{
        stage('Verify'){
            steps{
                script{
                      sh 'echo "*****************************************"'
                      sh 'echo "WARNING Check the input information"'
                      sh 'echo "Start Deploy ${hostname} on ${cliente}"'
                      sh 'echo "domain: ${domain}"'
                      sh 'echo "cores: ${cores}"'
                      sh 'echo "memory: ${memory}"'
                      sh 'echo "private_subnet: ${subnet_privada}"'
                      sh 'echo "WARNING Check the input information"'
                      sh 'echo "*****************************************"'
                      verify()
                }
            }
        }
        stage('Terraform Init'){
            steps{
                script{
                    sh 'terraform init'
                }
            }
        }
        stage('Deploy VM'){
            steps{
                script{
                     if("${cliente}"=='unique'){
                         deployVM()
                     }
                }
            }
        }
    }

}
