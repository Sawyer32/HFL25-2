# HFL25-2 v04
Detta är vecka 4-5 av mitt Dart-projekt för kursen HFL25-2. Projektet är en konsolapplikation som hanterar en lista över hjältar med olika attribut och typer.

## Funktioner
- Skapa och spara hjältar i en JSON-fil (`heroes.json`).
- Läs in hjältar från JSON-filen vid applikationens start.
- Spara ändringar till JSON-filen när man avslutar applikationen via menyn.
- Lägg till nya hjältar med namn, nivå, attribut (styrka och stamina) och typ (ras och faktion).
- Lista alla hjältar i systemet.
 - Separerar goda och onda hjältar när de listas.
- Sök efter hjältar baserat på namn via en nätverksförfrågan till en extern API om hjälten inte redan finns i listan.
- Hjältar sorteras efter styrka i fallande ordning när de listas.
- Ta bort hjältar från listan.

## Användning
1. Kör applikationen med kommandot `dart run bin/v04.dart`.
   Alternativt, `dart run` om du befinner dig i projektets rotmapp (v04).
2. Välj ett alternativ från huvudmenyn:
   - Skapa hjälte
   - Visa alla hjältar
   - Sök hjältar baserat på namn via API
   - Ta bort hjälte
   - Avsluta
3. Följ instruktionerna på skärmen för att interagera med applikationen.
4. När du väljer att avsluta, sparas alla ändringar automatiskt till `heroes.json`.

## Filstruktur
- `bin/`: Innehåller körbara skript och huvudprogrammet.
- `lib/`: Innehåller bibliotek och hjälpfunktioner.
- `lib/managers/`: Hanterar affärslogik och datahantering.
- `lib/models/`: Innehåller datamodeller för hjältar och deras attribut.
- `lib/helpers/`: Innehåller hjälpfunktioner för terminalhantering och utskrifter.
- `test/`: Innehåller enhetstester för applikationen.
- `test/mockManager/`: Innehåller mock-implementeringar för testning.
- `heroes.json`: JSON-fil som lagrar information om hjältarna.
