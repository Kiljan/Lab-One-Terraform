pipeline {
    agent { 
        node { 
            label 'terra' 
            } 
        }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Kiljan/terra.git'
            }
        }
        stage('Terraform init') {
            steps {
                sh 'terraform init'
                sh 'terraform validate'
            }
        }
        stage('Terraform destroy') {
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}