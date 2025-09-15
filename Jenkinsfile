pipeline {
    agent any

    stages {
        stage('git clone') {
            steps {
                git branch: 'main', url: 'https://github.com/abinashkumar19/jenkins-cicd.git'
            }
        }

        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('terraform apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
