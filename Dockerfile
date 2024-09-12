# Dockerfile

# Utiliser une image Python officielle
FROM python:3.8-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de l'application dans le conteneur
COPY src/ /app/src/
COPY tests/ /app/tests/
COPY requirements.txt /app/

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Commande par défaut pour exécuter les tests
CMD ["python", "-m", "unittest", "discover", "-s", "tests"]
