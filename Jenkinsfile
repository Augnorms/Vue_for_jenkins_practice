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
                     withCredentials([sshUserPrivateKey(
                        credentialsId: 'git-ssh-key',
                        keyFileVariable: 'SSH_KEY',
                        usernameVariable: 'GIT_USER'
                    )]) {
                        sh """
                            git config --global user.email
                            git config --global user.name
                            GIT_SSH_COMMAND="ssh -i ${SSH_KEY} -o IdentitiesOnly=yes" git tag -a ${RELEASE_VERSION} -m "Version ${RELEASE_VERSION}"
                            GIT_SSH_COMMAND="ssh -i ${SSH_KEY} -o IdentitiesOnly=yes" git push origin ${RELEASE_VERSION}
                        """
                    }
               }
            }
      }
      post{
            always {
                cleanWs()
            }
        }
    }
  }
