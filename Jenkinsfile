pipeline {
    agent any

    stages {
        stage('Webhook Test') {
            steps {
                echo "🚀 GitHub Webhook Triggered Successfully!"
                echo "Build time: ${new Date()}"
                sh 'echo "Current directory:" && pwd'
                sh 'echo "Files in repo:" && ls -l'
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
