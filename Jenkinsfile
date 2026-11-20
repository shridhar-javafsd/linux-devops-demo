pipeline {
  agent any
  stages {
    stage('Lint')    { steps { sh 'bash -n healthcheck.sh && echo "syntax OK"' } }
    stage('Test')    { steps { sh 'chmod +x *.sh && ./test.sh' } }
    stage('Package') {
      steps {
        sh 'tar czf healthcheck.tar.gz healthcheck.sh'
        archiveArtifacts artifacts: 'healthcheck.tar.gz'
      }
    }
  }
  post { always { echo "Build result: ${currentBuild.currentResult}" } }
}
