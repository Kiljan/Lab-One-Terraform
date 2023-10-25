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
        stage('SSH copy ID') {
            steps {
                sh 'cd /home/vv'
                sh 'sshpass -f password.txt ssh-copy-id vv@yourserver'
                sh 'sshpass -f password.txt ssh-copy-id vv@yourserver'
            }
        }
    }
}