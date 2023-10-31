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
                sh 'sshpass -f /home/vv/password.txt ssh-copy-id vv@10.17.3.56'
                sh 'sshpass -f /home/vv/password.txt ssh-copy-id vv@10.17.3.57'
                sh 'sshpass -f /home/vv/password.txt ssh-copy-id vv@10.17.3.58'
            }
        }
    }
}