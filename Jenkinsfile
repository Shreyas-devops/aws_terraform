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
       powershell 'terraform plan -out=tfplan'
                }
            }
            
        }
         stage('Manual Approval for Apply') {
            steps {
                script {
                    timeout(time: 10, unit: 'MINUTES') { // Optional: Set a timeout for approval
                        input message: 'Proceed with Terraform Apply?', ok: 'Approve', submitter: 'your_team_group' // Restrict submitters
                    }
                }
            }
        }
         stage('Terraform Apply') {
            steps {
                withAWS(credentials: 'AWS IAM'){
                 
                  powershell 'terraform apply -auto-approve tfplan'
                }
            }
            
        }
        
    }
}
