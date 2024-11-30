# Exemples de Bon et Mauvais Code

Voici des exemples pour illustrer les différences entre un code de bonne et de mauvaise qualité :

## Exemple 1 : Gestion des Exceptions
- **Bon Code** :
  ```python
  try:
      result = operation()
  except SpecificException as e:
      handle_error(e)
  ```

- **Mauvais Code** :
  ```python
  try:
      result = operation()
  except Exception:
      pass  # Mauvaise pratique, car les erreurs ne sont pas gérées correctement
  ```

## Exemple 2 : Nommage des Variables
- **Bon Code** :
  ```python
  def calculate_total_price(items, tax_rate):
      total_price = sum(items) * (1 + tax_rate)
      return total_price
  ```

- **Mauvais Code** :
  ```python
  def func(x, y):
      z = sum(x) * (1 + y)
      return z
  ```
  *Commentaires :* Le mauvais exemple utilise des noms de variables peu explicites, rendant le code difficile à comprendre.

## Exemple 3 : Boucles et Conditions
- **Bon Code** :
  ```python
  for user in users:
      if user.is_active:
          send_notification(user)
  ```

- **Mauvais Code** :
  ```python
  for i in range(len(users)):
      if users[i].status == 1:
          send_notification(users[i])
  ```
  *Commentaires :* Le bon exemple est plus lisible et utilise des méthodes claires comme `is_active`.

## Exemple 4 : DRY (Don’t Repeat Yourself)
- **Bon Code** :
  ```python
  def format_message(message):
      return f"[INFO] {message}"
  
  log = format_message("System is running")
  print(log)
  ```

- **Mauvais Code** :
  ```python
  message = "[INFO] System is running"
  print("[INFO] " + message.split("] ")[1])
  ```
  *Commentaires :* Le mauvais exemple duplique la logique et est moins maintenable.

## Exemple 5 : Validation des Entrées
- **Bon Code** :
  ```python
  def get_positive_number(value):
      if value < 0:
          raise ValueError("The value must be positive")
      return value
  ```

- **Mauvais Code** :
  ```python
  def get_positive_number(value):
      return abs(value)
  ```
  *Commentaires :* Le mauvais code masque les erreurs potentielles en transformant silencieusement des valeurs négatives.

## Exemple 6 : Utilisation des Modules Standards
- **Bon Code** :
  ```python
  import os
  
  def get_file_path(filename):
      return os.path.abspath(filename)
  ```

- **Mauvais Code** :
  ```python
  def get_file_path(filename):
      import os
      return os.getcwd() + "/" + filename
  ```
  *Commentaires :* Dans le mauvais exemple, l'importation de modules dans une fonction est inutile et déconseillée.

## Exemple 7 : Gestion de la Mémoire
- **Bon Code** :
  ```python
  with open("file.txt", "r") as file:
      content = file.read()
  ```

- **Mauvais Code** :
  ```python
  file = open("file.txt", "r")
  content = file.read()
  file.close()
  ```
  *Commentaires :* Le mauvais exemple peut provoquer des fuites de ressources si `file.close()` n'est pas appelé.
