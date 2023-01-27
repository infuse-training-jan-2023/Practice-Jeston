pipeline {
    agent any

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
