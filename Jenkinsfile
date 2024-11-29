pipeline {
  agent any

  stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/ellsalif/api_auto.git'
            }
        }

    stage('Setup Environment') {
            steps {
                script {
                    bat
                    python3 -m venv venv
                    .venv/bin/activate
                    pip install --upgrade pip
                    pip install robotframework
                }
            }
        }
        
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
