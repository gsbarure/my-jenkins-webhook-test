pipeline {
    agent any

    environment {
        AWS_CREDS = credentials('aws-jenkins-creds')    // your Jenkins credential ID
        AWS_ACCESS_KEY_ID     = "${AWS_CREDS_USR}"
        AWS_SECRET_ACCESS_KEY = "${AWS_CREDS_PSW}"
        AWS_DEFAULT_REGION    = "us-east-1"
    }

    stages {
        stage('Webhook Test') {
            steps {
                echo "🚀 GitHub Webhook Triggered Successfully!"
                echo "Build time: ${new Date()}"
                sh 'echo "Current directory:" && pwd'
                sh 'echo "Files in repo:" && ls -l'
            }
        }

        stage('Terraform Init & Apply') {
            steps {
                sh '''
                echo "🔧 Running Terraform Apply..."

                cd terraform

                terraform init
                terraform plan -out=tfplan
                terraform apply -auto-approve tfplan
                '''
            }
        }

        stage('Terraform Destroy') {
            steps {
                sh '''
                echo "🧹 Destroying Terraform resources..."

                cd terraform

                terraform destroy -auto-approve
                '''
            }
        }
    }

    post {
        success {
            echo "🎉 Build Completed Successfully!"
        }
    }
}
        
