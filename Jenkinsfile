pipeline {
    agent {
        label 'Terraform'
    }
    parameters {
        choice(name: 'Create', choices: ['YES', 'NO'], description: 'Do you need to Create the service?')
        choice(name: 'Destroy', choices: ['YES', 'NO'], description: 'Do you need to Destroy the service?')
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
            when {
                expression { params.Create == 'YES' }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }    
        }
        stage('Terraform Destroy') {
            when {
                expression { params.Destroy == 'YES' }
            }
            steps {
                sh 'terraform destroy'
            }    
        }
    }
}