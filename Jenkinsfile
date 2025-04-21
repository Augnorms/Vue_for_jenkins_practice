pipeline{
    agent any

    environment {
      VERSION = "1.0.${BUILD_NUMBER}"
      RELEASE_VERSION = "Release-1.0.${BUILD_NUMBER}"
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
        stage('Publish'){
            steps{
               script {
                    // Archive build artifacts
                    archiveArtifacts artifacts: 'dist/**', fingerprint: true

                    sh'''
                      git tag -a ${RELEASE_VERSION} -m "Release version ${RELEASE_VERSION}"
                      git push origin ${RELEASE_VERSION}
                      git push origin --tags
                      '''
            }
        }
      post{
            always {
                cleanWs()
            }
        }
    }
  }
}