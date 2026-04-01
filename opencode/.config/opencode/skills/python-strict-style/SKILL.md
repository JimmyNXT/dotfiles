---
name: python-strict-style
description: >
  Use this skill whenever writing, editing, or reviewing Python code. This skill enforces
  two non-negotiable standards: (1) black-compatible formatting and (2) strict type annotations
  on all variables, function parameters, and return types. Trigger this skill for any Python
  task — new scripts, functions, classes, refactors, bug fixes, code reviews, or snippets.
  Even for small one-off Python examples, apply these rules fully. If the user asks for Python
  code in any form, this skill must be active.
---

# Python Strict Style Skill

All Python code you write MUST follow two rules, with zero exceptions:

1. **Black formatting**
2. **Strict type annotations everywhere**

---

## Rule 1: Black Formatting

Format all code as if `black` (with default settings) has been run over it. Key rules:

- Line length: **88 characters** maximum
- Strings: use **double quotes** `"` — never single quotes
- Trailing commas in multi-line collections and function signatures
- One blank line between methods; two blank lines between top-level definitions
- Spaces around binary operators; no spaces inside brackets
- Consistent indentation: **4 spaces** (no tabs)
- Magic trailing comma: if a collection or argument list is split across lines, the last item gets a trailing comma

```python
# CORRECT (black-formatted)
def greet(name: str, times: int = 1) -> str:
    return ("Hello, " + name + "! ") * times


result: str = greet("Alice", times=3)
```

```python
# WRONG (not black-formatted)
def greet(name,times=1):
  return ('Hello, '+name+'! ')*times
result=greet('Alice',times=3)
```

---

## Rule 2: Strict Type Annotations

Every piece of Python code must be fully type-annotated. No implicit `Any`, no bare unannotated names.

### Function parameters and return types

Every function and method must have:
- A type annotation for **every parameter** (including `self` is fine to omit, but all others must be annotated)
- An explicit **return type** annotation — use `-> None` when nothing is returned

```python
# CORRECT
def add(x: int, y: int) -> int:
    return x + y


def log_message(message: str, level: str = "INFO") -> None:
    print(f"[{level}] {message}")
```

```python
# WRONG — missing annotations
def add(x, y):
    return x + y
```

### Variable annotations

Annotate variables at the point of assignment when the type is not obvious from the right-hand side. Always annotate:
- Empty collections (`[]`, `{}`, `set()`)
- Variables assigned `None` initially
- Variables where the type isn't immediately obvious

```python
# CORRECT
count: int = 0
names: list[str] = []
lookup: dict[str, int] = {}
maybe_value: str | None = None
items: list[int] = [1, 2, 3]  # annotation is explicit even when obvious
```

```python
# WRONG — missing variable annotations
count = 0
names = []
lookup = {}
```

### Use `from __future__ import annotations` for forward references

Place this at the top of every module that uses class names before they are defined.

```python
from __future__ import annotations
```

### Common type imports

Use `from collections.abc import ...` and built-in generics (Python 3.10+ style):

```python
from collections.abc import Callable, Generator, Iterable, Iterator, Sequence
from typing import Any, TypeVar, Generic, Protocol, overload

# Built-in generics (Python 3.9+)
x: list[int] = []
y: dict[str, list[int]] = {}
z: tuple[int, str, float] = (1, "a", 3.0)

# Union types (Python 3.10+)
value: int | None = None
result: str | int = compute()
```

If targeting Python < 3.9, use `from __future__ import annotations` and `List`, `Dict`, `Tuple` from `typing`.

### Classes

All instance attributes must be annotated in `__init__` or as class-level annotations:

```python
class Point:
    x: float
    y: float

    def __init__(self, x: float, y: float) -> None:
        self.x = x
        self.y = y

    def distance_to(self, other: Point) -> float:
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2) ** 0.5
```

### Dataclasses and TypedDict (prefer these for data containers)

```python
from dataclasses import dataclass


@dataclass
class Config:
    host: str
    port: int
    debug: bool = False
```

```python
from typing import TypedDict


class UserRecord(TypedDict):
    name: str
    age: int
    email: str | None
```

### `Any` usage

Avoid `Any` unless interfacing with untyped third-party code. When forced to use it, add a `# type: ignore` comment or a `# noqa` comment explaining why.

---

## Checklist Before Producing Code

Before finalising any Python output, verify:

- [ ] All functions have typed parameters and return types
- [ ] All variables are annotated (especially empty collections and `None` initialisations)
- [ ] Double quotes used throughout
- [ ] Line length ≤ 88 characters
- [ ] Two blank lines between top-level definitions
- [ ] Trailing commas in all multi-line structures
- [ ] No bare `Any` without justification
- [ ] Imports are at the top and organised (stdlib → third-party → local)

---

## Quick Reference Example

A complete, correct module following all rules:

```python
from __future__ import annotations

from collections.abc import Sequence
from dataclasses import dataclass, field


@dataclass
class Student:
    name: str
    grades: list[float] = field(default_factory=list)

    def add_grade(self, grade: float) -> None:
        self.grades.append(grade)

    def average(self) -> float | None:
        if not self.grades:
            return None
        return sum(self.grades) / len(self.grades)


def top_students(
    students: Sequence[Student],
    threshold: float,
) -> list[Student]:
    return [s for s in students if (avg := s.average()) is not None and avg >= threshold]


def main() -> None:
    cohort: list[Student] = [
        Student(name="Alice"),
        Student(name="Bob"),
    ]
    cohort[0].add_grade(88.5)
    cohort[0].add_grade(91.0)
    cohort[1].add_grade(74.0)

    results: list[Student] = top_students(cohort, threshold=80.0)
    for student in results:
        print(f"{student.name}: {student.average()}")


if __name__ == "__main__":
    main()
```
