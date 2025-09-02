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
                  sh 'terraform init'
                  sh 'terraform plan' 
                  sh 'terraform apply -auto-approve'
                }
            }
        }
        
        
    }
}
