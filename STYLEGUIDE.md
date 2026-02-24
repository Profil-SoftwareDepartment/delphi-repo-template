# Delphi Style Guide

This document defines mandatory coding standards for all Delphi (Object Pascal) projects in this repository.

All contributors and AI-assisted tooling must comply.

---

# 1. General Principles

- Code must be readable, maintainable, and testable.
- Explicitness is preferred over implicit behavior.
- Architecture boundaries must not be violated.
- Follow existing patterns in the repository.

---

# 2. Naming Conventions

## 2.1 Units

- PascalCase
- No underscores unless technically required
- One primary type per unit

Example:

```delphi
CustomerService.pas
OrderRepository.pas
```

Forbidden:
```delphi
profil_adm_import.pas  
Profil.*.pas  
```

---

## 2.2 Classes

- Prefix: T
- PascalCase

Example:
```delphi
TOrderService
TCustomerRepository
```

---

## 2.3 Interfaces

- Prefix: I
- PascalCase

Example:

```delphi
IOrderService
ILogger
```

---

## 2.4 Fields

- Private fields must start with F
- PascalCase

Example:
```delphi
FRepository
FConnection
```

---

## 2.5 Methods & Functions

- PascalCase
- Verb-based names for actions
- Boolean functions must start with Is, Has, Can, Should

Example:

```delphi
LoadCustomer
SaveOrder
IsValid
HasPermission
```

### 2.5.1 Parameters

- PascalCase
- Parameters must start with A

Example

```delphi
ACustomer
AQuery
AValue
```

---

## 2.6 Constants

- Prefix: c or C_ or SQL_
- Uppercase or PascalCase (must be consistent within a unit)

Example:
```delphi
cDefaultTimeout
C_MAX_RETRIES
SQL_UPDATE_TABLE
```

---

# 3. Unit Structure

Units must follow this order:

1. unit declaration
2. interface
3. uses (interface)
4. type declarations
5. const declarations
6. var declarations
7. implementation
8. uses (implementation)
9. method implementations
10. initialization/finalization (if required)

---

# 4. Uses Clause Rules

- Keep minimal.
- Remove unused units.
- No circular references.
- Group logically:
  - System
  - Third-party
  - Project units

---

# 5. Formatting Rules

- 2 spaces indentation (no tabs)
- One statement per line
- No trailing whitespace
- Line length ≤ 120 characters
- Always use begin/end blocks
- begin/end blocks can be omitted for single statements
- The last statement in a begin/end block must end with a semicolon

Example:

```delphi
if Condition then
begin
  DoSomething;
  DoAnotherThing;
end;
```

---

# 6. Exception Handling

- Use try..finally for resource management.
- Use try..except only where meaningful.
- Do not swallow exceptions silently.
- Log technical exceptions if logging framework exists.

---

# 7. Memory Management

- Always free owned objects.
- Use TObjectList<T> with ownership enabled when appropriate.
- Avoid memory leaks in constructors.
- Do not mix ownership responsibilities.

---

# 8. Database Code

- No SQL in UI units.
- Always parameterize queries.
- Respect transaction boundaries.
- No hardcoded credentials.

---

# 9. Architecture Rules

Client layer:
- UI logic only.
- No persistence logic.

Server layer:
- Business logic.
- Service orchestration.

Data layer:
- Persistence only.
- No UI references.

Shared/domain:
- Pure domain logic.
- No infrastructure dependencies.

---

# 10. Modern Delphi Practices

- Avoid deprecated APIs.
- Avoid `with` statements.
- Avoid global variables.
- Prefer explicit typing.
- Prefer generics where appropriate.

---

# 11. Testing

- Business logic must be testable.
- Prefer DUnitX.
- Avoid infrastructure coupling in unit tests.
- Use mocking where appropriate.

---

# 12. Documentation

- Public classes and complex methods require XMLDoc comments.
- Document side effects and preconditions.
- Keep comments meaningful.

---

Compliance with this document is mandatory.
