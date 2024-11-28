pipeline {
  agent any
  stages {
    stage('Testing') {
      steps {
        sh 'Test/api.robot'
      }
    }

    stage('Reporting') {
      steps {
        archiveArtifacts 'log.html, output.xml, report.html'
      }
    }

  }
}
