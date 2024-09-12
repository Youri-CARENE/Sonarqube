# src/app.py

class Calculator:
    def add(self, x, y):
        """Addition de deux nombres."""
        return x + y

    def subtract(self, x, y):
        """Soustraction de deux nombres."""
        return x - y

    def multiply(self, x, y):
        """Multiplication de deux nombres."""
        return x * y

    def divide(self, x, y):
        """Division de deux nombres avec gestion des erreurs."""
        if y == 0:
            raise ValueError("Division par zéro !")
        return x / y

# Exemple d'utilisation
if __name__ == "__main__":
    calc = Calculator()
    print(calc.add(10, 5))
    print(calc.divide(10, 0))
