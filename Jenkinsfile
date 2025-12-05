pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')       // Jenkins credential ID
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')       // Jenkins credential ID
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
                echo "🔧 Running Terraform..."

                cd terraform   # <--- folder in repo where TF code exists

                terraform init
                terraform plan -out=tfplan
                terraform apply -auto-approve tfplan
                '''
            }
        }
    }

    post {
        success {
            echo "🎉 Build Completed Successfully!"
        }
        failure {
            echo "❌ Build Failed!"
        }
    }
}
