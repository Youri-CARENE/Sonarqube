# Installation de SonarQube avec Docker

Voici un guide pour déployer **SonarQube** en utilisant Docker.

---

## Prérequis

1. Docker et Docker Compose installés sur votre machine.
2. Un minimum de 2 Go de mémoire disponible pour SonarQube.

---

## Étape 1 : Télécharger l'image SonarQube

1. **Tirer l'image officielle SonarQube depuis Docker Hub** :
   ```bash
   docker pull sonarqube:latest
   ```

---

## Étape 2 : Configurer Docker Compose

1. **Créer un fichier `docker-compose.yml`** :
   ```yaml
   version: "3"
   services:
     sonarqube:
       image: sonarqube:latest
       container_name: sonarqube
       ports:
         - "9000:9000"
       environment:
         - SONAR_JDBC_URL=jdbc:postgresql://postgres:5432/sonarqube
         - SONAR_JDBC_USERNAME=sonar
         - SONAR_JDBC_PASSWORD=sonar
       depends_on:
         - postgres

     postgres:
       image: postgres:13
       container_name: postgres
       environment:
         POSTGRES_USER: sonar
         POSTGRES_PASSWORD: sonar
         POSTGRES_DB: sonarqube
       volumes:
         - postgres_data:/var/lib/postgresql/data

   volumes:
     postgres_data:
   ```

2. Sauvegardez ce fichier dans le répertoire de votre choix.

---

## Étape 3 : Lancer les conteneurs

1. **Exécuter Docker Compose** :
   ```bash
   docker-compose up -d
   ```

2. **Vérifiez que les conteneurs sont en cours d'exécution** :
   ```bash
   docker ps
   ```

---

## Étape 4 : Accéder à SonarQube

1. Ouvrez votre navigateur et accédez à l'adresse :
   ```
   http://localhost:9000
   ```

2. Connectez-vous avec les identifiants par défaut :
   - **Utilisateur** : `admin`
   - **Mot de passe** : `admin`

3. Changez le mot de passe à la première connexion.

---

## Étape 5 : Configurer les paramètres SonarQube

1. Configurez vos projets et vos règles de qualité depuis le tableau de bord.
2. Ajoutez des intégrations avec des outils CI/CD si nécessaire.

---

## Points supplémentaires

- Vous pouvez personnaliser les configurations dans le fichier `docker-compose.yml` pour inclure des volumes persistants ou des paramètres spécifiques.
- Pour un environnement de production, pensez à configurer un proxy inversé comme NGINX ou Traefik avec SSL.

---

