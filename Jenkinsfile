pipeline {
    agent {
        label 'Terraform'
    }
    stages {
        stage('Source Code') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'a36a2bcd-95e7-41be-8bd2-ba017d6ca4ae', url: 'https://github.com/NirmalKumaran-2106/Terraform.git']])
            }
        }
        stage('Terraform Init') {
            steps {
                    sh ' terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
            
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }    
        }
    }
}