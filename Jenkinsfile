pipeline {
    agent any

    stages {
        stage('build') {
            steps {
               bat '''
			   bat ruby Program_tests.rb
			   '''
            }
        }
        
    }
}
