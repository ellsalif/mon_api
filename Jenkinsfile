pipeline {
  agent any
  stages {
    stage('Clone Repository') {
      steps {
        git(branch: 'main', url: 'https://github.com/ellsalif/api_auto.git')
      }
    }

    stage('Setup Environment') {
            steps {
              script {
                    bat  'python -m pip install --upgrade pip'
                    bat  ' pip install robotframework'  
              }
             }
        }

        

    stage('Testing') {
      steps {
        bat 'robot Tests/api.robot'
      }
    }

    stage('Reporting') {
      steps {
        archiveArtifacts 'log.html, output.xml, report.html'
      }
    }

  }
}
