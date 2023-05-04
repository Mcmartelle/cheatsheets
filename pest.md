# Pest Cheat sheet

| Syntax           | Meaning                           | Syntax                  | Meaning              |
|:----------------:|:---------------------------------:|:-----------------------:|:--------------------:|
| `foo =  { ... }` | [regular rule]                    | `baz = @{ ... }`        | [atomic]             |
| `bar = _{ ... }` | [silent]                          | `qux = ${ ... }`        | [compound-atomic]    |
| `#tag = ...`     | [tags]                            | `plugh = !{ ... }`      | [non-atomic]         |
| `"abc"`          | [exact string]                    | `^"abc"`                | [case insensitive]   |
| `'a'..'z'`       | [character range]                 | `ANY`                   | [any character]      |
| `foo ~ bar`      | [sequence]                        | <code>baz \| qux</code> | [ordered choice]     |
| `foo*`           | [zero or more]                    | `bar+`                  | [one or more]        |
| `baz?`           | [optional]                        | `qux{n}`                | [exactly *n*]        |
| `qux{m, n}`      | [between *m* and *n* (inclusive)] |                         |                      |
| `&foo`           | [positive predicate]              | `!bar`                  | [negative predicate] |
| `PUSH(baz)`      | [match and push]                  |                         |                      |
| `POP`            | [match and pop]                   | `PEEK`                  | [match without pop]  |
| `DROP`           | [pop without matching]            | `PEEK_ALL`              | [match entire stack] |