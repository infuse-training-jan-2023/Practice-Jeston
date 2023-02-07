pipeline {
    
    agent {
        label 'jenkins-slave-jeston'
    }

    stages {
        stage('Java Program') {
            steps {
                bat ''' 
                javac DuplicatesString.java
                java DuplicateString
                '''
                echo "Success"
            }
        }
    }
}
