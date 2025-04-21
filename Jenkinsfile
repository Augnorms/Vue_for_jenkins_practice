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
                script{
                    def versionContent = """{
                        "version": "${VERSION}",
                        "release": "${RELEASE_VERSION}"
                    }"""
                    writeFile file: 'dist/version.json', text: versionContent
                    echo "Version file created with content: ${versionContent}"
                }
                sh '''
                  yarn build
                '''
            }
        }
        // stage('Inject version'){
        //     steps{
        //         echo 'Injecting version...'
                
        //     }
        // }
    }
}