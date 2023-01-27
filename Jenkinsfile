pipeline {
    agent any

    stages {
        stage('build') {
            steps {
           
            
               bat '''
                echo %Path%
               ruby -v
			   ruby Program_tests.rb
			   '''
            }
        }
        
    }
}
