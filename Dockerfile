pipeline {
    agent any
    stages {
        stage('Clone the repo') {
            steps {
                echo 'Cloning the repository:'
                git 'https://github.com/mudit097/node-todo-cicd.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building the ToDo application on Docker'
                sh 'docker build . -t todo-nginx'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the application on Docker'
                sh 'docker run -p 80:80 -d todo-nginx'
            }
        }
    }
}
