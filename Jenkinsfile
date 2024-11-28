pipeline {
  agent any
  stages {
    stage('Testing') {
      steps {
        bat 'Tests/api.robot'
      }
    }

    stage('Reporting') {
      steps {
        archiveArtifacts 'log.html, output.xml, report.html'
      }
    }

  }
}