pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Shreyas-devops/aws_terraform.git'
            }
        }
        stage('Terraform Init') {
            steps {
                withAWS(credentials: 'AWS IAM'){
                  powershell 'terraform init'
                                  }
            }
            
        }
         stage('Terraform Plan') {
            steps {
                withAWS(credentials: 'AWS IAM'){
                  powershell 'terraform plan' 
                  powershell 'terraform apply -auto-approve'
                }
            }
            
        }
         stage('Terraform Apply') {
            steps {
                withAWS(credentials: 'AWS IAM'){
                  powershell 'terraform apply -auto-approve'
                }
            }
            
        }
        
    }
}
