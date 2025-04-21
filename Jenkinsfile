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
        stage('Unit test'){
            steps{
                echo 'Running unit tests...'
                sh '''
                  yarn test:unit
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