# Installation de SonarQube avec Kubernetes

Voici un guide pour déployer **SonarQube** dans un cluster Kubernetes.

---

## Prérequis

1. Un cluster Kubernetes fonctionnel (vous pouvez utiliser Minikube, K3s, ou un cluster cloud).
2. `kubectl` configuré pour se connecter à votre cluster Kubernetes.
3. `Helm` installé sur votre machine.

---

## Étape 1 : Créer un espace de noms Kubernetes pour SonarQube

1. **Créer un namespace dédié** :
   ```bash
   kubectl create namespace sonarqube
   ```

---

## Étape 2 : Déployer PostgreSQL

SonarQube nécessite une base de données PostgreSQL.

1. **Installer PostgreSQL avec Helm** :
   ```bash
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm install postgresql bitnami/postgresql -n sonarqube      --set auth.username=sonar,auth.password=sonar,auth.database=sonarqube
   ```

2. **Vérifiez que PostgreSQL est en cours d'exécution** :
   ```bash
   kubectl get pods -n sonarqube
   ```

---

## Étape 3 : Déployer SonarQube avec Helm

1. **Ajouter le dépôt Helm pour SonarQube** :
   ```bash
   helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
   helm repo update
   ```

2. **Installer SonarQube avec Helm** :
   ```bash
   helm install sonarqube sonarqube/sonarqube -n sonarqube      --set postgresql.enabled=false      --set jdbcUrl=jdbc:postgresql://postgresql.sonarqube.svc.cluster.local:5432/sonarqube      --set sonarProperties.sonar.jdbc.username=sonar      --set sonarProperties.sonar.jdbc.password=sonar
   ```

3. **Vérifiez que SonarQube est en cours d'exécution** :
   ```bash
   kubectl get pods -n sonarqube
   ```

---

## Étape 4 : Accéder à SonarQube

1. **Exposer SonarQube avec un service NodePort** (si vous n'avez pas d'ingress) :
   ```bash
   kubectl patch svc sonarqube -n sonarqube -p '{"spec": {"type": "NodePort"}}'
   ```

2. **Obtenez l'URL pour accéder à SonarQube** :
   ```bash
   kubectl get svc sonarqube -n sonarqube
   ```
   Accédez à l'adresse `http://<NODE_IP>:<NODE_PORT>` dans un navigateur.

---

## Étape 5 : Configurer les paramètres SonarQube

1. Connectez-vous avec les identifiants par défaut :
   - **Utilisateur** : `admin`
   - **Mot de passe** : `admin`
2. Changez le mot de passe après la première connexion.
3. Configurez vos projets et vos règles de qualité dans le tableau de bord.

---

## Points supplémentaires

- Vous pouvez personnaliser les paramètres Helm en ajoutant un fichier `values.yaml` avec vos configurations spécifiques.
- Pour un environnement de production, il est recommandé d'utiliser un Ingress Controller et un certificat SSL pour sécuriser les connexions.
