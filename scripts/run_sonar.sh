#!/bin/bash

# Exécution de docker-compose pour démarrer SonarQube et le projet
docker-compose up -d

# Attendre que SonarQube soit prêt
echo "Attente du démarrage de SonarQube..."
sleep 60  # Ajuste selon ta machine

# Exécution de l'analyse SonarQube
docker exec -it python-app sonar-scanner \
  -Dsonar.projectKey=sonarqube-python-project \
  -Dsonar.sources=src \
  -Dsonar.tests=tests \
  -Dsonar.host.url=http://sonarqube:9000 \
  -Dsonar.login=admin \
  -Dsonar.password=admin

# Arrêter les conteneurs après l'exécution
docker-compose down
