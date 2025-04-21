pipeline{
    agent any

    environment {
        // Define environment variables here
        VERSION = '1.0.0'
        RELEASE_VERSION = 'Release 1.0.0'
    }
    stages{
        stage('Audit tools'){
            steps{
                sh'''
                  git version
                  node -v
                  npm -v
                  yarn -v
                '''
            }

        }
        stage('Package installation'){
            steps{
                echo 'Installing packages...'
                sh '''
                  yarn install
                '''
            }
        }
        stage('Run Linting'){
            steps{
                echo 'Running Linting...'
                sh '''
                  yarn lint
                '''
            }
        }
        stage('Unit test'){
            steps{
                echo 'Running unit tests...'
                sh '''
                  yarn test
                '''
            }
        }
        stage('Build'){
            steps{
                echo 'Running Build..'
                sh '''
                  yarn build
                '''
            }
        }
    }
}