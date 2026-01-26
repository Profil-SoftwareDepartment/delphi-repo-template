# Tools

Dieses Verzeichnis enthält **Skripte und Hilfswerkzeuge**, die den Entwicklungs-, Build- und Release-Prozess unterstützen.

Alle Inhalte in diesem Ordner dienen der **Automatisierung, Standardisierung und Qualitätssicherung**.

---

## Grundsatz

Alles, was:
- wiederholt ausgeführt wird
- fehleranfällig ist
- Teil des Build- oder Release-Prozesses ist

gehört **nicht in Handbücher**, sondern in **Skripte in diesem Verzeichnis**.

---

## Inhalt und Struktur

Typische Struktur:

```

tools/
├─ format-code.bat
├─ generate-release-notes.bat
├─ validate-repo.bat
└─ README.md

```

Die konkrete Struktur kann projektabhängig variieren, die **Prinzipien bleiben gleich**.

## Skripte

### generate-release-notes.bat

- bereitet Versionierungsinformationen aus der Commit-History auf

---

### format-code.bat

- nutzt GExperts Formatter
- stellt reproduzierbare Formatierung sicher

---

### validate-repo.bat

prüft

- Repository-Struktur
- unerwünschte Dateien
- Einhaltung von Standards

Dieses Skript wird:
- vor Releases
- vor größeren Refactorings
- optional lokal vor Commits

ausgeführt.

---

## Namenskonventionen

- sprechende Namen
- Verben für Aktionen (`generate`, `validate`, `install`)
- keine kryptischen Abkürzungen

Beispiele:
```

generate-release-notes.bat
validate-repo.bat
install-git-hooks.bat

```

---

## Abhängigkeiten

- Skripte sollen mit Bordmitteln lauffähig sein
- Externe Tools müssen dokumentiert sein
- Pfade dürfen nicht hardcodiert sein

---

## Nutzung

Skripte werden ausgeführt:

- lokal durch Entwickler
- automatisiert im Build (FinalBuilder)
- gezielt im Release-Prozess

Skripte müssen:
- verständliche Konsolenausgaben liefern
- bei Fehlern mit Exit-Code ≠ 0 abbrechen

---

## Verantwortung

- Skripte sind Teil des Projekts
- Änderungen an Skripten werden reviewed
- Kaputte Automatisierung ist ein Bug

---

## Grundsatz zum Abschluss

> **Wenn ein Prozess erklärungsbedürftig ist, fehlt ein Skript.**  
> **Wenn ein Skript erklärungsbedürftig ist, fehlt eine README.**
```
