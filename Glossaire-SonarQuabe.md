# Glossaire SonarQube

## 1. **SonarQube**
**Définition**: Plateforme open-source utilisée pour l'analyse continue de la qualité du code, identifiant les bugs, vulnérabilités, et problèmes de maintenabilité.
**Utilité**: Améliore la qualité du code en fournissant des rapports détaillés sur les problèmes de code et en assurant le suivi de la qualité au fil du temps.

---

## 2. **Quality Gate (Passerelle de qualité)**
**Définition**: Ensemble de conditions définies dans SonarQube que le projet doit respecter pour être considéré comme de bonne qualité.
**Utilité**: Fait office de barrière pour s'assurer que les critères de qualité sont respectés avant de valider ou déployer un code.
**Exemple**: Un seuil de couverture de code de 80% et l'absence de bugs bloquants peuvent constituer des critères de qualité.

---

## 3. **Issues (Problèmes)**
**Définition**: Défauts identifiés dans le code par SonarQube, comme les bugs, vulnérabilités, ou dettes techniques.
**Utilité**: Avertit les développeurs des problèmes à corriger pour améliorer la qualité du code.
**Exemple**: Problèmes comme une variable non utilisée, ou une vulnérabilité liée à la sécurité.

---

## 4. **Technical Debt (Dette technique)**
**Définition**: Mesure du travail supplémentaire nécessaire pour corriger les erreurs de conception, de code ou d'architecture dans un projet.
**Utilité**: Permet de quantifier la charge de travail pour améliorer le code en termes de maintenabilité et de qualité.
**Exemple**: Si une méthode complexe est difficile à maintenir, elle peut être qualifiée de dette technique.

---

## 5. **Code Coverage (Couverture de code)**
**Définition**: Pourcentage de lignes de code couvertes par des tests unitaires.
**Utilité**: Mesure l'efficacité des tests automatisés pour valider le comportement du code.
**Exemple**: Si un projet a 75% de couverture de code, cela signifie que 75% du code est testé par des tests unitaires.

---

## 6. **Leak Period (Période de fuite)**
**Définition**: Période de temps pendant laquelle SonarQube surveille les nouveaux problèmes introduits dans le code.
**Utilité**: Focalise l'attention sur les nouveaux problèmes plutôt que sur les anciens, facilitant ainsi l'amélioration continue.
**Exemple**: Un projet pourrait être configuré pour vérifier les nouveaux problèmes depuis la dernière version ou commit.

---

## 7. **Hotspot de sécurité**
**Définition**: Partie du code qui nécessite une vérification manuelle pour déterminer s'il s'agit d'une réelle vulnérabilité ou d'un faux positif.
**Utilité**: Aide à identifier des zones sensibles du code qui nécessitent une revue humaine pour évaluer les risques.
**Exemple**: Utilisation de l'authentification pourrait nécessiter une revue pour s'assurer qu'il n'y a pas de faille de sécurité.

---

## 8. **Rule (Règle)**
**Définition**: Critères définis dans SonarQube pour identifier des problèmes dans le code (ex: normes de codage, sécurité, etc.).
**Utilité**: Permet de définir des bonnes pratiques et des exigences de qualité dans le code source.
**Exemple**: Une règle peut imposer que toutes les méthodes publiques doivent être documentées avec des commentaires.

---

## 9. **Bug**
**Définition**: Problème dans le code identifié par SonarQube qui peut entraîner des erreurs lors de l'exécution du programme.
**Utilité**: Signale des problèmes qui doivent être corrigés pour éviter des erreurs fonctionnelles.
**Exemple**: Une méthode qui retourne toujours la même valeur peut être considérée comme un bug si elle est supposée être dynamique.

---

## 10. **Vulnerability (Vulnérabilité)**
**Définition**: Failles de sécurité dans le code identifiées par SonarQube qui peuvent être exploitées pour compromettre le système.
**Utilité**: Aide à identifier les failles de sécurité dans le code avant qu'elles ne soient exploitées par des attaquants.
**Exemple**: Une injection SQL est une vulnérabilité typique détectée par SonarQube.

---

## 11. **Code Smell (Mauvaise odeur de code)**
**Définition**: Code qui fonctionne mais qui est mal conçu, ce qui rend sa maintenance plus difficile à long terme.
**Utilité**: Avertit les développeurs des problèmes de conception pour améliorer la maintenabilité du code.
**Exemple**: Une méthode trop longue ou une classe avec trop de responsabilités peut être considérée comme un code smell.

---

## 12. **Project Key (Clé de projet)**
**Définition**: Identifiant unique pour un projet dans SonarQube.
**Utilité**: Permet de différencier et de gérer plusieurs projets dans une même instance SonarQube.
**Exemple**: Un projet peut avoir une clé unique comme `my-company:my-project`.

---

## 13. **Quality Profile (Profil de qualité)**
**Définition**: Ensemble de règles appliquées à un projet pour vérifier la qualité du code.
**Utilité**: Permet d'appliquer des standards de qualité spécifiques à un projet ou à une technologie.
**Exemple**: Un profil de qualité pour un projet Java pourrait inclure des règles spécifiques pour la gestion des exceptions et la documentation des méthodes.

---

## 14. **Quality Metric (Métrique de qualité)**
**Définition**: Mesures utilisées pour évaluer la qualité du code (comme la couverture de tests, la complexité cyclomatique, etc.).
**Utilité**: Aide à surveiller les aspects mesurables de la qualité du code et à fixer des objectifs d'amélioration.
**Exemple**: La complexité cyclomatique est une métrique qui mesure la complexité d'une méthode ou d'une fonction.

---

## 15. **SonarScanner**
**Définition**: Outil utilisé pour analyser le code source et envoyer les résultats à SonarQube.
**Utilité**: Lance l'analyse du projet, collecte les métriques et les envoie à l'instance SonarQube.
**Commande**:
    ```bash
    sonar-scanner -Dsonar.projectKey=my-project -Dsonar.sources=./src
    ```

---

## 16. **Project Dashboard (Tableau de bord de projet)**
**Définition**: Interface graphique dans SonarQube qui présente les résultats de l'analyse d'un projet, y compris les métriques de qualité, les problèmes et les tendances.
**Utilité**: Permet de visualiser facilement l'état de la qualité d'un projet et de suivre son évolution au fil du temps.
**Exemple**: Un tableau de bord peut afficher la couverture de code, le nombre de bugs, et la dette technique.

---

## 17. **Duplications (Duplications de code)**
**Définition**: Portion de code qui apparaît plusieurs fois dans le projet, ce qui rend le code plus difficile à maintenir.
**Utilité**: Aide à identifier le code redondant pour le refactorer et améliorer la maintenabilité.
**Exemple**: Deux fonctions ayant le même corps de code sont signalées comme une duplication.

---

## 18. **Plugin SonarQube**
**Définition**: Extension permettant d'ajouter des fonctionnalités supplémentaires à SonarQube (par exemple, l'analyse de langages supplémentaires, l'intégration avec d'autres outils, etc.).
**Utilité**: Étend les capacités de SonarQube pour s'adapter à des environnements spécifiques ou à des besoins supplémentaires.
**Exemple**: Plugin pour l'analyse de code en Python ou pour l'intégration avec Jenkins.

---

## 19. **Security Hotspot**
**Définition**: Partie du code qui nécessite une vérification manuelle pour déterminer s'il y a une vulnérabilité réelle.
**Utilité**: Aide à identifier des zones sensibles dans le code qui pourraient contenir des problèmes de sécurité potentiels.
**Exemple**: Une méthode qui traite des données sensibles peut être marquée comme hotspot de sécurité.

---

## 20. **Maintainability Rating**
**Définition**: Indicateur qui mesure la facilité avec laquelle le code peut être maintenu, sur une échelle de A (excellent) à E (très faible).
**Utilité**: Fournit une évaluation globale de la maintenabilité du code, en tenant compte des problèmes de conception, de duplication, etc.
**Exemple**: Un projet sans dette technique pourrait obtenir un score A en maintenabilité.

---

## 21. **Reliability Rating**
**Définition**: Indicateur qui évalue la fiabilité du code, sur une échelle de A (aucun problème) à E (faible fiabilité).
**Utilité**: Mesure la probabilité que le code présente des bugs qui entraîneraient un comportement inattendu ou des erreurs en production.
**Exemple**: Un projet avec des bugs critiques pourrait avoir un score de fiabilité plus bas (D ou E).

---

## 22. **Security Rating**
**Définition**: Indicateur qui mesure la sécurité du code, sur une échelle de A (aucune vulnérabilité
