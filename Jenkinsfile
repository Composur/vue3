pipeline {
  agent {
    node {
      label 'master'
    }

  }
  stages {
    stage('build') {
      steps {
        sh '''npm install 
npm run build'''
      }
    }

  }
}