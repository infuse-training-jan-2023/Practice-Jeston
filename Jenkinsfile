pipeline {
    agent {jenkins-slave-jeston}

    stages {
        stage('build') {
            steps {
               bat '''
			   ruby Program_tests.rb
			   '''
            }
        }
        
    }
}
