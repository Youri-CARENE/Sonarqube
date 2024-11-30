# Configuration de SonarCloud

Voici un guide pour configurer **SonarCloud** sur le cloud pour l’analyse continue de la qualité de votre code. Cela s’applique lorsque vous voulez intégrer SonarCloud avec des services tels que **GitHub**, **GitLab**, **Azure DevOps**, ou **Bitbucket**.

---

## Étape 1 : Créer un compte SonarCloud

1. Rendez-vous sur [SonarCloud](https://sonarcloud.io).
2. Connectez-vous ou inscrivez-vous en utilisant votre compte GitHub, GitLab, Azure DevOps, ou Bitbucket.
3. Une fois connecté, configurez votre organisation en choisissant la plateforme à laquelle vous voulez connecter SonarCloud.

---

## Étape 2 : Ajouter un projet sur SonarCloud

1. Dans votre tableau de bord SonarCloud, cliquez sur **"Add a project"**.
2. Sélectionnez la plateforme (GitHub, GitLab, Azure DevOps, ou Bitbucket).
3. Autorisez SonarCloud à accéder à vos dépôts de code.
4. Choisissez le projet que vous voulez analyser.

---

## Étape 3 : Configurer l’analyse de code

SonarCloud utilise un **analyseur** qui s’exécute dans vos pipelines CI/CD. Voici les étapes pour configurer votre pipeline en fonction de votre plateforme.

### Option A : GitHub Actions

Ajoutez un fichier `sonarcloud.yml` dans `.github/workflows` :
```yaml
name: SonarCloud Analysis

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  sonarcloud:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Set up JDK 11
        uses: actions/setup-java@v3
        with:
          java-version: '11'
          distribution: 'adopt'
      
      - name: Cache SonarCloud packages
        uses: actions/cache@v3
        with:
          path: ~/.sonar/cache
          key: ${{ runner.os }}-sonar
          restore-keys: ${{ runner.os }}-sonar
      
      - name: Run SonarCloud scan
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
        run: |
          mvn clean verify sonar:sonar \
            -Dsonar.projectKey=<project_key> \
            -Dsonar.organization=<organization_key> \
            -Dsonar.host.url=https://sonarcloud.io
```

Remplacez `<project_key>` et `<organization_key>` par vos identifiants SonarCloud.

---

### Option B : GitLab CI/CD

Ajoutez le code suivant dans `.gitlab-ci.yml` :
```yaml
stages:
  - sonarcloud

sonarcloud:
  image: maven:3.8.1-openjdk-11
  stage: sonarcloud
  script:
    - mvn clean verify sonar:sonar -Dsonar.projectKey=<project_key> -Dsonar.organization=<organization_key> -Dsonar.host.url=https://sonarcloud.io
  variables:
    SONAR_TOKEN: $SONAR_TOKEN
```

---

### Option C : Azure DevOps

1. Allez dans votre projet Azure DevOps.
2. Créez ou éditez un pipeline YAML et ajoutez les étapes suivantes :
```yaml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: SonarCloudPrepare@1
  inputs:
    SonarCloud: 'SonarCloud'
    organization: '<organization_key>'
    scannerMode: 'CLI'
    configMode: 'manual'
    projectKey: '<project_key>'
    projectName: '<project_name>'
    projectVersion: '1.0'
    extraProperties: |
      sonar.java.binaries=**/target/classes

- script: mvn clean verify
  displayName: 'Build project'

- task: SonarCloudAnalyze@1

- task: SonarCloudPublish@1
```

---

## Étape 4 : Générer un **SONAR_TOKEN**

1. Accédez à votre compte SonarCloud.
2. Allez dans **My Account** > **Security**.
3. Créez un **token** personnel. Copiez ce token et ajoutez-le comme secret dans votre plateforme CI/CD.

- **GitHub** : Ajoutez le token dans **Settings > Secrets and variables > Actions** sous le nom `SONAR_TOKEN`.
- **GitLab** : Ajoutez le token dans **Settings > CI/CD > Variables**.
- **Azure DevOps** : Ajoutez le token dans **Pipeline > Library > Variable Groups**.

---

## Étape 5 : Exécuter le pipeline

1. Lancez votre pipeline CI/CD.
2. Une fois le pipeline terminé, vous verrez les résultats d'analyse directement dans SonarCloud.

---

## Étape 6 : Configurer les règles de qualité

1. Dans SonarCloud, allez dans **Quality Profiles** pour personnaliser vos règles de code (comme les vulnérabilités, les bugs, la duplication de code, etc.).
2. Configurez des seuils pour bloquer les pipelines si des problèmes critiques sont détectés.

---
