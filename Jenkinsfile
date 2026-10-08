pipeline {
    agent any
    stages {
        stage("print hello world!!") {
            steps {
             echo 'Hello World!!'
            }
        }
        stage("print hello world!!") {
            steps {
             echo 'Hello World!!'
            }
        }
    }
}


pipeline {
    agent any
    environments{
        SCANNER_HOME = tool 'sonar-scaner'
    }
    stages {
        stage ("clean WS") {
            steps {
                cleanWs()
            }
        }
        stage ("clean WS") {
            steps {
                cleanWs()
            }
        }
    }
}
