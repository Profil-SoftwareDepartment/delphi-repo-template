# FinalBuilder

## Variablen-Konvention

### Grundprinzipien

* Sprechende Namen statt Kürzel
* Feste Präfixe je Kategorie
* Keine impliziten Abhängigkeiten
* Keine Wiederverwendung für unterschiedliche Bedeutungen
* Groß-/Kleinschreibung konsistent

### Namensschema (formal)

```<PREFIX>_<DOMÄNE>_<BESCHREIBUNG>```

## Struktur

FinalBuilder Project

```
try
  Initialize
  Git Actions
  Generate BuildInfo
  Build Delphi
  PostBuild
  Package
finally
  CleanUp
end
```

### Initialize

* Lädt Konfiguration aus FinalBuilder.ini
* Prüft Status des lokalen Repositories
* Initialisiert Pfade

### Git Actions

* Klont das Repository
* Erstellt einen Tag
* Holt den Commit Hash

### Generate BuildInfo

* Füllt die Versionsinfo

### Build Delphi

* Check Connected DFM
* Compile

### PostBuild

* madExcept
* Signtool

### Package

Kopieren der Exe nach 
* Dev
* Test
* Staging
jeweils mit Abfrage

### CleanUp

Löscht das Build-Verzeichnis, bis auf die erstellte Exe
