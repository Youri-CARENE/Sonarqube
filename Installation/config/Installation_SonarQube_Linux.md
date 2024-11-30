# Installation de SonarQube sur une distribution Linux

Voici un guide pour installer **SonarQube** sur une distribution Linux :

---

## Étape 1 : Préparer l'environnement

1. **Mettre à jour le système** :
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. **Installer Java** (prérequis pour SonarQube) :
   ```bash
   sudo apt install openjdk-11-jdk -y
   ```
   Vérifiez la version installée :
   ```bash
   java -version
   ```

3. **Installer PostgreSQL** (base de données pour SonarQube) :
   ```bash
   sudo apt install postgresql postgresql-contrib -y
   ```
   Configurer PostgreSQL :
   ```bash
   sudo -u postgres psql
   CREATE DATABASE sonarqube;
   CREATE USER sonar WITH ENCRYPTED PASSWORD 'sonar';
   GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonar;
   \q
   ```

---

## Étape 2 : Télécharger et configurer SonarQube

1. **Télécharger SonarQube** :
   ```bash
   wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.1.69595.zip
   ```
   (Remplacez la version par la plus récente si besoin.)

2. **Décompresser l'archive** :
   ```bash
   unzip sonarqube-9.9.1.69595.zip
   mv sonarqube-9.9.1.69595 /opt/sonarqube
   ```

3. **Créer un utilisateur pour SonarQube** :
   ```bash
   sudo useradd -r -s /bin/false sonar
   sudo chown -R sonar:sonar /opt/sonarqube
   ```

---

## Étape 3 : Configurer SonarQube

1. Modifier le fichier de configuration :
   ```bash
   sudo nano /opt/sonarqube/conf/sonar.properties
   ```
   Ajoutez les configurations suivantes :
   ```
   sonar.jdbc.username=sonar
   sonar.jdbc.password=sonar
   sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube
   ```

2. Assurez-vous que l'utilisateur `sonar` a les permissions :
   ```bash
   sudo chown -R sonar:sonar /opt/sonarqube
   ```

---

## Étape 4 : Créer un service systemd

1. Créer un fichier de service :
   ```bash
   sudo nano /etc/systemd/system/sonarqube.service
   ```
   Ajoutez le contenu suivant :
   ```
   [Unit]
   Description=SonarQube service
   After=syslog.target network.target

   [Service]
   Type=forking
   ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
   ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
   User=sonar
   Group=sonar
   Restart=always
   LimitNOFILE=65536
   LimitNPROC=4096

   [Install]
   WantedBy=multi-user.target
   ```

2. **Recharger systemd** :
   ```bash
   sudo systemctl daemon-reload
   ```

3. **Démarrer SonarQube** :
   ```bash
   sudo systemctl start sonarqube
   sudo systemctl enable sonarqube
   ```

---

## Étape 5 : Accéder à SonarQube

1. Ouvrez un navigateur et accédez à l'adresse :
   ```
   http://<votre-ip>:9000
   ```

2. Connectez-vous avec les identifiants par défaut :
   - **Utilisateur** : `admin`
   - **Mot de passe** : `admin`

3. Changez le mot de passe à la première connexion.

---
