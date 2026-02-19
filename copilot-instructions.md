Hier ist eine **produktionsreife `copilot-instructions.md`** für eure **Delphi Client-Server Repositories**.
Sie ist strikt genug für Enterprise-Umgebungen, aber praxisnah für tägliche Entwicklung.

---

# copilot-instructions.md

## Repository Scope

This repository contains a **Delphi (Object Pascal) client-server application**.

Copilot must:

* strictly follow the project’s `STYLEGUIDE.md`
* respect architectural layering
* avoid introducing forbidden units
* prefer testable and maintainable code
* generate tests whenever feasible

---

## Primary Rule: Styleguide Compliance

Copilot must always:

1. Read and follow `STYLEGUIDE.md`
2. Respect:

   * naming conventions
   * formatting rules
   * visibility ordering
   * exception handling patterns
   * logging standards
   * dependency direction rules

If a generated suggestion conflicts with the style guide:
→ **The style guide wins.**

---

## Architecture Expectations

Projects are typically structured as:

* Client (UI layer – VCL or FMX)
* Server (application logic / service layer)
* Shared domain models
* Data access layer

Copilot must:

* Keep UI logic out of business logic
* Avoid mixing persistence code into UI units
* Prefer dependency injection patterns where established
* Respect existing layering boundaries

If uncertain:
→ Follow the structure already present in the repository.

---

## Unit Restrictions (Critical Rule)

The repository must **NOT** contain units from the internal shared library.

Forbidden:

* `Profil.*.pas`
* `profil_adm_import.pas`

Copilot must:

* Never generate new units matching `Profil.*`
* Never reference or recreate `profil_adm_import.pas`
* Not duplicate functionality assumed to exist in the shared library

If functionality seems missing:
→ Create an abstraction/interface instead of copying library code.

---

## Naming Conventions

Unless `STYLEGUIDE.md` states otherwise:

* Units: `UnitName.pas` using PascalCase
* Classes: `T<ClassName>`
* Interfaces: `I<InterfaceName>`
* Private fields: `F<FieldName>`
* Methods: PascalCase
* Constants: According to style guide (often `c` or `C_` prefix)

Copilot must remain consistent within a file.

---

## Code Generation Standards

When generating Delphi code:

* Use modern Object Pascal syntax
* Prefer explicit typing
* Avoid deprecated constructs
* Avoid `with` statements
* Avoid global state unless already established pattern
* Use `try..finally` for resource handling
* Use `try..except` only where meaningful

---

## Memory & Resource Management

Copilot must:

* Always free owned objects
* Prefer `TObjectList<T>` with ownership
* Respect ARC differences if FMX/mobile is involved
* Avoid memory leaks in examples

---

## Database & Data Access

If data access is involved:

* Follow repository patterns already in use
* Avoid inline SQL in UI units
* Parameterize queries
* Avoid hardcoded credentials
* Respect transaction boundaries

---

## Test Generation (Strong Preference)

When adding:

* new business logic
* services
* utility classes
* domain logic

Copilot should attempt to generate:

* DUnitX tests (if DUnitX is used)
* Mock-based tests where applicable
* Isolated unit tests (no DB unless explicitly integration test)

Test code should:

* Be deterministic
* Avoid side effects
* Avoid real infrastructure calls

If no test framework is detected:
→ Suggest one but do not introduce dependencies automatically.

---

## What Copilot Must Avoid

* Introducing new third-party libraries without explicit instruction
* Adding units from internal shared library (`Profil.*`)
* Breaking existing layering
* Reformatting entire files unnecessarily
* Generating speculative architectural refactors

---

## When Extending Existing Code

Copilot must:

* Preserve formatting and ordering
* Maintain visibility sections (`private`, `protected`, `public`, `published`)
* Not reorder methods unless required
* Keep uses clauses structured and minimal

---

## Uses Clause Rules

* Remove unused units
* Avoid circular references
* Group system, third-party, and project units logically
* Do not introduce forbidden `Profil.*` units

---

## Error Handling

Follow repository patterns:

* Domain exceptions for business rules
* Technical exceptions for infrastructure
* Avoid swallowing exceptions
* Log errors if logging framework is present

---

## Performance & Stability

* Avoid unnecessary object creation
* Prefer streaming over loading entire datasets if applicable
* Be careful with multi-threading (respect existing synchronization patterns)
* Avoid blocking calls in UI thread

---

## Security Awareness

When relevant:

* Validate inputs
* Avoid SQL injection
* Avoid exposing internal exception messages to clients
* Respect authentication/authorization layers

---

## Summary of Priorities

1. Follow `STYLEGUIDE.md`
2. Respect architecture
3. Never introduce `Profil.*` units
4. Prefer testable code
5. Generate tests when feasible
6. Avoid unnecessary dependencies

---

Wenn du möchtest, kann ich dir zusätzlich:

* eine **striktere Version mit CI-Check-Regeln**
* eine ergänzende **`DEVELOPMENT_RULES.md`**
* oder ein **Copilot Guardrail-Template speziell für Client-Server-Architektur**

Sag mir, wie stark ihr Copilot disziplinieren wollt.
