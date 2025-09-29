# Kalkylator Terminal

En enkel termnialbaserad Kalkylator skriven i Dart som kan hantera grundläggande matematiska uttryck.

## Vad programmet kan göra

Kalkylatorn kan hantera följande matematiska operationer:
* **Addition** (`+`)
* **Subtraktion** (`-`)
* **Multiplikation** (`*`)
* **Division** (`/`)

### Exempel på användning
```
Ange ett matematiskt uttryck: 5+3
Resultat: 8

Ange ett matematiskt uttryck: 10*2
Resultat: 20

Ange ett matematiskt uttryck: 15/3
Resultat: 5
```

## Hur man kör programmet

- Dart SDK måste vara installerat på din dator

### Steg för att köra programmet

1. **Öppna en terminal** och navigera till projektmappen:
   ```bash
   cd c:<Sökväg till projektet>\v01
   ```

2. **Kör programmet** med något av följande kommandon:
   ```bash
   # Alternativ 1: Kör direkt
   dart run
   
   # Alternativ 2: Kör main-filen
   dart run bin/v01.dart
   ```

3. **Ange ditt matematiska uttryck** när programmet frågar och tryck Enter

4. **Se resultatet** som visas på skärmen

5. **Avsluta programmet** med att skriva q eller quit

## Hur man skapar en funktion i Dart

I Dart skapar du funktioner med följande syntax:

### Grundläggande funktionssyntax
```dart
// Enkel funktion utan parametrar
void helloWorld() {
  print('Hej, Världen!');
}

// Enkel funktion med parameter
void greeting(String name) {
  print('Hej, $name')
}

// Exempel på att använda funktion med parameter
// Resultat: Hej, John Doe
greeting("John Doe");
```
