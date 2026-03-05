pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "tp5site:01"
        DOCKER_HOST = "tcp://172.20.10.3:2375" // IP de ta VM + port Remote API
    }

    stages {
        stage('Cloner le repo') {
            steps {
                git 'https://github.com/malickgky/webjenkins' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %DOCKER_IMAGE% ."
                }
            }
        }

        stage('Déployer sur VM') {
            steps {
                script {
                    bat "docker stop tp5site || true"
                    bat "docker rm tp5site || true"
                    bat "docker run -d -p 8082:80 --name tp5site %DOCKER_IMAGE%"
                }
            }
        }
    }

    post {
        success {
            echo "Déploiement terminé ! Accède à http://172.20.10.3:8082"
        }
        failure {
            echo "Le pipeline a échoué "
        }
    }
}


