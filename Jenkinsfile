pipeline {
    agent any
environment {
            PATH = "C:\Program Files\Git\bin:${env.PATH}"
        }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Shreyas-devops/aws_terraform.git'
            }
        }
        stage('Terraform Init') {
            steps {
                withAWS(credentials: 'AWS IAM'){
                  sh 'terraform init'
                  sh 'terraform plan' 
                  sh 'terraform apply -auto-approve'
                }
            }
        }
        
        
    }
}
