pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Parpa-123/Repo.git'
            }
        }

        stage('Build') {
            steps {
                bat "mvn clean install -Dmaven.test.skip=true"
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.war'
            }
        }

        stage('Deployment') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcatuser', path: '', url: 'http://localhost:8080/')], 
                      war: 'target/*.war', 
                      contextPath: 'app'
            }
        }

        stage('Notification') {
            steps {
                emailext(
                    subject: "Job Completed",
                    body: """Jenkins pipeline job for Maven build completed.""",
                    to: "devopseng129@gmail.com"
                )
            }
        }
    }
}
