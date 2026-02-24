# Development Rules

This document defines process and architectural rules beyond pure coding style.

---

# 1. Architectural Integrity

The project follows a Client-Server architecture.

Strict separation is required between:

- UI layer
- Business logic layer
- Data access layer
- Shared domain layer

Violations must be treated as defects.

---

# 2. Forbidden Units

The following units must never exist in this repository:

- Profil.*.pas
- profil_adm_import.pas

These belong to the shared internal library.

Do not copy, recreate, or reference them.

If functionality is required:
- Define an interface abstraction.
- Integrate through approved shared packages.

---

# 3. Dependency Rules

- UI must not depend on data layer directly.
- Data layer must not depend on UI.
- Domain layer must not depend on infrastructure.
- Dependencies must flow inward.

Prefer constructor injection for dependencies.

---

# 4. Test Expectations

When adding:

- Business logic
- Services
- Utility classes

You must:

- Add or update DUnitX tests.
- Ensure deterministic behavior.
- Avoid database or network in unit tests.

Integration tests must be clearly separated.

---

# 5. Pull Request Rules

Each PR must:

- Compile without warnings.
- Pass all tests.
- Not introduce forbidden units.
- Respect STYLEGUIDE.md.
- Not reformat unrelated code.

---

# 6. Refactoring Rules

Refactoring is allowed if:

- Behavior remains unchanged.
- Tests continue to pass.
- Architectural layering is improved or preserved.

Large refactors require discussion.

---

# 7. Error Handling Policy

- Business rule violations → domain exceptions.
- Infrastructure failures → technical exceptions.
- Never swallow exceptions.
- Log unexpected errors.

---

# 8. Security Requirements

- Validate all external input.
- Parameterize all SQL.
- Do not expose internal exception messages to clients.
- Respect authentication and authorization boundaries.

---

# 9. Performance Guidelines

- Avoid loading large datasets unnecessarily.
- Avoid blocking calls in UI thread.
- Be careful with multithreading and shared state.
- Measure before optimizing.

---

# 10. Code Reviews

Review focus:

- Architecture compliance
- Memory safety
- Thread safety
- Exception correctness
- Test coverage
- Forbidden dependency usage

---

# 11. AI-Assisted Code Generation

When using AI tools:

- Generated code must follow STYLEGUIDE.md.
- Generated code must not introduce Profil.* units.
- Tests must be generated when applicable.
- Developers remain responsible for correctness.

---

Failure to comply with these rules may result in rejection of changes.
