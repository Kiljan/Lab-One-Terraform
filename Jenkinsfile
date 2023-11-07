pipeline {
    agent { 
        node { 
            label 'terra' 
            } 
        }

    environment {
        TERRAPATH = '/home/vv/terraform'
    }

    stages {
        stage('Terraform init') {
            steps {
                dir ("${TERRAPATH}") {
                sh 'terraform init'
                sh 'terraform validate'
                }
            }
        }
        stage('Terraform destroy') {
            steps {
                dir ("${TERRAPATH}") {
                sh 'terraform destroy -auto-approve'
                }
            }
        }
        stage('Terraform apply') {
            steps {
                dir ("${TERRAPATH}") {
                sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}