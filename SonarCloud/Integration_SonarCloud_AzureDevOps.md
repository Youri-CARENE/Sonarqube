# Intégration de SonarCloud avec Azure DevOps

Ce document explique comment intégrer **SonarCloud** dans un pipeline CI/CD d'Azure DevOps.

---

## Étape 1 : Ajouter l'extension SonarCloud dans Azure DevOps

1. Connectez-vous à [Azure DevOps](https://dev.azure.com/).
2. Accédez à l'organisation dans laquelle se trouve votre projet.
3. Allez dans **Marketplace** (via l'icône dans le coin supérieur droit).
4. Recherchez **SonarCloud** et installez l'extension officielle.

---

## Étape 2 : Configurer SonarCloud

1. Connectez-vous à [SonarCloud](https://sonarcloud.io/).
2. Allez dans **My Account > Security** et générez un **SONAR_TOKEN**.
3. Copiez ce token, qui sera utilisé dans votre pipeline Azure DevOps.

---

## Étape 3 : Ajouter SonarCloud comme service dans Azure DevOps

1. Dans Azure DevOps, allez dans **Project Settings > Service Connections**.
2. Cliquez sur **New service connection** > **SonarCloud**.
3. Configurez la connexion avec vos informations :
   - **Token** : Collez le SONAR_TOKEN généré.
   - **Organisation SonarCloud** : Saisissez le nom de votre organisation SonarCloud.
4. Testez la connexion et sauvegardez-la.

---

## Étape 4 : Ajouter un pipeline YAML avec SonarCloud

Voici un exemple de pipeline YAML pour un projet Maven. Adaptez-le en fonction de vos besoins (par exemple, pour un projet .NET ou JavaScript) :

```yaml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

variables:
  # Remplacez par les valeurs de votre organisation et projet
  SONAR_ORGANIZATION: 'your-organization'
  SONAR_PROJECT_KEY: 'your-project-key'

steps:
- task: SonarCloudPrepare@1
  inputs:
    SonarCloud: 'SonarCloud'
    organization: '$(SONAR_ORGANIZATION)'
    scannerMode: 'CLI'
    configMode: 'manual'
    projectKey: '$(SONAR_PROJECT_KEY)'
    projectName: 'Your Project Name'
    projectVersion: '1.0'
    extraProperties: |
      sonar.java.binaries=**/target/classes

- script: |
    mvn clean install
  displayName: 'Build project with Maven'

- task: SonarCloudAnalyze@1
  displayName: 'Run SonarCloud analysis'

- task: SonarCloudPublish@1
  displayName: 'Publish SonarCloud results'
```

---

## Étape 5 : Exécuter le pipeline

1. Enregistrez le fichier `azure-pipelines.yml` dans le dépôt de votre projet.
2. Créez ou modifiez un pipeline Azure DevOps pour utiliser ce fichier YAML.
3. Exécutez le pipeline et observez les étapes :
   - **SonarCloudPrepare** : Configure l’analyse.
   - **Build project** : Compile le projet.
   - **SonarCloudAnalyze** : Analyse la qualité du code.
   - **SonarCloudPublish** : Publie les résultats sur SonarCloud.

---

## Étape 6 : Vérifier les résultats dans SonarCloud

1. Une fois le pipeline exécuté, connectez-vous à SonarCloud.
2. Sélectionnez votre projet pour voir les résultats d'analyse :
   - Bugs
   - Vulnérabilités
   - Code smells
   - Couverture des tests

---

## Points à retenir

- Ajoutez des seuils de qualité (Quality Gates) dans SonarCloud pour bloquer le pipeline si des problèmes critiques sont détectés.
- Si vous utilisez un autre langage ou outil de build (par exemple .NET ou Node.js), adaptez le pipeline pour inclure la commande spécifique au build.

---
