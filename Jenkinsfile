pipeline {
    agent any

    environment {
        VERSION = "1.0.${BUILD_NUMBER}"
        RELEASE_VERSION = "Release-1.0.${BUILD_NUMBER}"
    }

    stages {
        stage('Audit tools') {
            steps {
                sh '''
                    git version
                    node -v
                    npm -v
                    yarn -v
                '''
            }
        }

        stage('Configure Git') {
            steps {
                sh '''
                    git config --global user.email "jenkins@yourcompany.com"
                    git config --global user.name "Jenkins CI"
                '''
            }
        }

        stage('Package installation') {
            steps {
                echo 'Installing packages...'
                sh 'yarn install'
            }
        }

        stage('Run Linting') {
            steps {
                echo 'Running Linting...'
                sh 'yarn lint'
            }
        }

        stage('Unit test') {
            steps {
                echo 'Running unit tests...'
                sh 'yarn test'
            }
        }

        stage('Build') {
            steps {
                echo 'Running Build...'
                sh 'yarn build'
            }
        }

        stage('Tag and Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: '833c712c-944d-4c6b-8356-4c764419d694',
                    usernameVariable: 'GIT_USERNAME',
                    passwordVariable: 'GIT_PASSWORD'
                )]) {
                    sh '''
                        git config --global user.email "augustinenormanyo98@gmail.com"
                        git config --global user.name "$GIT_USERNAME"
                        git tag -a ${RELEASE_VERSION} -m "Release version ${RELEASE_VERSION}"
                        git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Augnorms/Vue_for_jenkins_practice.git ${RELEASE_VERSION}
                    '''
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
