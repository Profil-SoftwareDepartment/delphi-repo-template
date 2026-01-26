# Dokumentation

Dieses Verzeichnis enthält die **technische und fachliche Dokumentation** des Projekts.

Ziel ist es, **Wissen dauerhaft im Repository zu verankern** und nicht an Personen oder implizite Annahmen zu binden.

---

## Inhalt und Struktur

Typische Unterverzeichnisse:

docs/
├─ architecture/
│ └─ overview.md
├─ decisions/
│ └─ ADR-0001-build-strategy.md
├─ setup/
│ └─ development-environment.md
├─ release-notes/
│ └─ 3.2.0.md
└─ README.md

---

## Architektur

Architekturdokumente beschreiben:

- Systemüberblick
- Modulgrenzen
- Abhängigkeiten
- technische Leitplanken

**Wichtig:**  
Architekturentscheidungen werden nicht in Präsentationen dokumentiert, sondern versioniert im Repository.

---

## Architecture Decision Records (ADR)

Grundlegende Entscheidungen werden als **ADR** festgehalten:

- Warum wurde etwas entschieden?
- Welche Alternativen gab es?
- Welche Konsequenzen hat die Entscheidung?

ADRs sind **unveränderlich**. Neue Entscheidungen führen zu neuen ADRs.

---

## Setup & Betrieb

Dokumente im Ordner `setup/` beschreiben:

- Entwicklungsumgebung
- Build-Voraussetzungen
- externe Abhängigkeiten

Diese Dokumente müssen aktuell gehalten werden.

---

## Release Notes

Release Notes sind:

- versioniert
- reproduzierbar
- aus Git-Historie ableitbar

Sie dienen:
- Support
- Betrieb
- Kundenkommunikation

---

## Grundsätze

- Dokumentation ist **Teil des Codes**
- Dokumentation wird reviewed
- Veraltete Dokumentation ist ein Bug

---

## Verantwortung

- Jeder Entwickler ist für die Dokumentation seiner Änderungen mitverantwortlich
- Größere Änderungen erfordern Dokumentations-Updates
