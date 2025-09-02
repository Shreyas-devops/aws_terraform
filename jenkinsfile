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
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Add input step for manual approval if desired
                input 'Proceed with Terraform Apply?'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
        
    }
}
