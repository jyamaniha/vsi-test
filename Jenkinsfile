pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Stage Build'
            }
        }
        stage('Test') {
            steps {
                echo 'Stage Test'
                sh 'terraform init'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Stage Deploy'
                sh 'terraform apply -auto-approve'
            }
        }
    } 
}
