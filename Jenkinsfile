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
        
        stage('Publish') {
            steps {
                script {
                    // Archive build artifacts
                    archiveArtifacts artifacts: 'dist/**', fingerprint: true
                    
                    // Git tagging with credentials
                    withCredentials([usernamePassword(
                        usernameVariable: 'Augnorms',
                        passwordVariable: 'microvelli027'
                    )]) {
                        sh """
                            git tag -a ${RELEASE_VERSION} -m "Release version ${RELEASE_VERSION}"
                            git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/https://github.com/Augnorms/Vue_for_jenkins_practice.git ${RELEASE_VERSION}
                        """
                    }
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