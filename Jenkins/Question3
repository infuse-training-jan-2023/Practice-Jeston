pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                script {
                    echo "I'm in stage:$env.STAGE_NAME"
                }
            }
        }
        stage('test') {
            steps {
                  script {
                    echo "I'm in stage:$env.STAGE_NAME"
                }
            }
        }
        
    }
}