pipeline {
    agent any

    stages {
        stage('build') {
            steps {
            echo %Path%
            
               bat '''
               ruby -v
			   ruby Program_tests.rb
			   '''
            }
        }
        
    }
}
