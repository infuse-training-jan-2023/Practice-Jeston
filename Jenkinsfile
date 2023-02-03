pipeline {
    agent any

    stages {
        stage('Java Program') {
            steps {
                bat ''' javac DuplicateString.java
                java DuplicateString
                '''
                echo "Success"
            }
        }
    }
}
