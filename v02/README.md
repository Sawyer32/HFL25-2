# HFL25-2 v02
Detta är vecka 2 av mitt Dart-projekt för kursen HFL25-2. Projektet är en konsolapplikation som hanterar en lista över hjältar med olika attribut och typer.

## Funktioner
- Lägg till nya hjältar med namn, nivå, attribut (styrka och stamina) och typ (ras och faktion).
- Lista alla hjältar i systemet.
- Sök efter hjältar baserat på namn.
- Hjältar sorteras efter styrka i fallande ordning när de listas.

## Användning
1. Kör applikationen med kommandot `dart run bin/v02.dart`.
   Alternativt, `dart run` om du befinner dig i projektets rotmapp (v02).
2. Välj ett alternativ från huvudmenyn:
   - Lägg till hjälte
   - Lista hjältar
   - Sök hjälte
   - Avsluta
3. Följ instruktionerna på skärmen för att interagera med applikationen.

## Filstruktur
- `bin/`: Innehåller körbara skript och huvudprogrammet.
- `lib/`: Innehåller bibliotek och hjälpfunktioner.
- `test/`: Innehåller enhetstester för applikationen.
- `heroes.json`: JSON-fil som lagrar information om hjältarna.
