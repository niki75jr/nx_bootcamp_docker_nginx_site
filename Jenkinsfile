pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Start of Stage Build"
                echo "Building......."
                sh 'docker-compose build'
                echo "End of Stage Build"
            }
        }
        stage('Pre-Deploy') {
            steps {
                echo "Start of Stage Pre-Deploy"
                sh '''#!/bin/bash
                if [[ $(docker ps -aq) ]]; then
                docker rm -f $(docker ps -aq)
                fi
                '''
                echo "End of Stage Pre-Deploy"
            }
        }
        stage('Deploy') {
            steps {
                echo "Start of Stage Deploy"
                echo "Deploying......."
                sh '''#!/bin/bash
                docker-compose up -d
                '''
                echo "End of Stage Deploy"
            }
        }
        stage('Smoke-test') {
            steps {
                echo "Start of Stage Smoke-test"
                echo "Smoke-testing......."
                sh '''#!/bin/bash
                  if [[ $(docker ps -a | grep -P 'Up.*nginxsite$') ]]; then
                    echo 'OK'
                  else
                    exit 1
                  fi
                '''
                echo "End of Stage Smoke-test"
            }
        }
    }
   post { 
    success { 
      sh '''#!/bin/bash
      curl -s -X POST https://api.telegram.org/bot1854092372:AAExI4p2c1vVezZMDs9YHA0PEYrocf0TpjA/sendMessage -d chat_id=463493238 -d text="🟢| SUCCESS: $(date)"
      '''
    }
    failure {
      sh '''#!/bin/bash
      curl -s -X POST https://api.telegram.org/bot1854092372:AAExI4p2c1vVezZMDs9YHA0PEYrocf0TpjA/sendMessage -d chat_id=463493238 -d text="🔴| FAILURE: $(date)"
      '''
    }
  }
}

