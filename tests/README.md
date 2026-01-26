# Tests

Dieses Verzeichnis ist für **automatisierte Tests** vorgesehen.

Auch wenn aktuell noch keine oder wenige Tests existieren, ist die Struktur **verbindlich definiert**, um zukünftige Erweiterungen zu ermöglichen.

---

## Ziel

- Qualität absichern
- Regressionen vermeiden
- Refactorings ermöglichen

Tests sind kein Selbstzweck, sondern ein **Werkzeug zur Risikominimierung**.

---

## Struktur

tests/
├─ unit/
│ └─ README.md
├─ integration/
│ └─ README.md
├─ testdata/
└─ README.md


---

## Unit Tests

Unit Tests prüfen:

- einzelne Klassen
- einzelne Units
- klar abgegrenzte Funktionen

Eigenschaften:
- schnell
- unabhängig
- deterministisch

---

## Integrationstests

Integrationstests prüfen:

- Zusammenspiel mehrerer Module
- externe Abhängigkeiten
- Datenflüsse

Sie dürfen:
- langsamer sein
- mehr Setup benötigen

---

## Testdaten

Der Ordner `testdata/` enthält:

- Beispielkonfigurationen
- Mock-Daten
- Testdateien

**Keine produktiven Daten!**

---

## Aktueller Stand

- Tests sind optional, aber ausdrücklich erwünscht
- Neue Module sollen testbar entworfen werden
- Fehlende Tests gelten als **technische Schulden**

---

## Einbindung in den Build

- Tests können perspektivisch in den Build integriert werden
- Fehlgeschlagene Tests blockieren Releases

---

## Verantwortung

- Entwickler sind für Tests ihrer Änderungen verantwortlich
- Qualität ist Teamaufgabe
