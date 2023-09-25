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
                    //def initOutput = sh(script: 'terraform init 2>&1 | tee terraform_init_output.log', returnStdout: true).trim()
                    //echo "Terraform Init Output:\n${initOutput}"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
                //def planOutput = sh(script: 'terraform plan 2>&1 | tee terraform_plan_output.log', returnStdout: true).trim()
                //echo "Terraform Plan Output:\n${planOutput}"
            }
            
        }
        //stage('Terraform apply') {
        //    steps {
        //        sh 'terraform apply --auto-approve'
        //        //def applyOutput = sh(script: 'terraform apply --auto-approve 2>&1 | tee terraform_apply_output.log', returnStdout: true).trim()
        //        //echo "Terraform Apply Output:\n${applyOutput}"
        //    }    
        //}
    }
}