pipeline {
    agent any

    environment {
        MY_ENV_VAR = 'Hello, World!'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                def repoUrl = 'https://github.com/Augnorms/Vue_for_jenkins_practice.git'
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: repoUrl]],
                    extensions: [[$class: 'CleanBeforeCheckout'], [$class: 'CloneOption', noTags: false, reference: '', shallow: true, depth: 1, timeout: 10]],
                ])
            }
        }
        stage('Build') {
            steps {
     
                sh '''
                    ls  
                    echo "In build stage"
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    echo "In test stage"
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    echo "In deploy stage Value of ENV variable is "$MY_ENV_VAR"
                '''
            }
        }
    }

    post {
        success {
            echo 'pipeline is successful.'
        }

        failure {
            echo 'pipeline failed.'
        }
    }

}