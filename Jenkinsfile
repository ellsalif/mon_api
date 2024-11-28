pipeline {
  agent any
  stages {
    stage('Testing') {
      steps {
        sh 'robot tests/api.robot'
      }
    }

    stage('Reporting') {
      steps {
        archiveArtifacts 'log.html, output.xml, report.html'
      }
    }

  }
}