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
                    bat  'python -m pip install --upgrade pip'
            }

      steps {
                    bat  ' pip install robotframework'           
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
