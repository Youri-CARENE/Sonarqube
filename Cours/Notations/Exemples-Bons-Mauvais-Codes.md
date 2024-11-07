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