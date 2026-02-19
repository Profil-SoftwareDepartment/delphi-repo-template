# Delphi Repository Template

Dieses Repository dient als **Standard-Vorlage für neue Delphi-Projekte** innerhalb der Entwicklungsabteilung.
Es stellt eine einheitliche Projektstruktur, vorbereitete Konfigurationsdateien sowie unterstützende Skripte bereit, um neue Projekte schnell, konsistent und wartbar aufzusetzen.

---

## Ziel des Templates

Das Template soll:

* eine **standardisierte Ordner- und Projektstruktur** bereitstellen
* wiederkehrende **Initialisierungsschritte automatisieren**
* konsistente **Git-, Build- und Test-Konfigurationen** sicherstellen
* neuen Projekten einen **sauberen, wartbaren Startpunkt** geben

---

## Projektstruktur

Nach der Initialisierung entsteht folgende Grundstruktur:

```
/src            → Anwendungs- bzw. Bibliothekscode
/tests          → Unit- und Integrationstests
/docs           → Projektdokumentation
/finalbuilder   → FinalBuilder-Dateien
/tools          → Hilfsskripte für Entwicklung/CI
```

Die Struktur kann projektspezifisch erweitert werden, sollte aber grundsätzlich beibehalten werden, um Konsistenz zwischen Repositories sicherzustellen.

---

## Verwendung des Templates

### 1. Neues Repository erstellen

* Erstelle ein neues Repository auf GitHub
* Klone das Repository auf deinem PC
* Kopiere ```init-repo-structure.bat``` in das Repository
* Führe ```init-repo-structure.bat``` aus
* ```init-repo-structure.bat``` kann nun gelöscht werden

Das Skript:

* erstellt fehlende Standardordner
* legt Basisdateien an
* bereitet das Repository für den ersten Commit vor

---

## Dokumentation

* Projektspezifische Dokumentation in `/docs`
* Architektur- und Schnittstellenbeschreibungen frühzeitig ergänzen
* Änderungen an Struktur oder Buildprozess dokumentieren

---

## Anpassung des Templates

Dieses Repository wird **zentral gepflegt**.
Verbesserungen am Template bitte über:

* Issue erstellen **oder**
* Pull Request mit Begründung einreichen

Ziel ist eine kontinuierliche Weiterentwicklung der Projektstandards.
