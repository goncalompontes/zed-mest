(type_expression
  "type" @keyword
  "in" @keyword)

(type_expression
  "and" @keyword)

(if_expression
  "if" @keyword
  "then" @keyword
  "else" @keyword)

(let_expression
  "let" @keyword
  "in" @keyword)

(let_expression
  "rec" @keyword)

(let_expression
  "and" @keyword)

(match_expression
  "match" @keyword)

(lambda_expression
  "|" @operator)

(match_arm
  "|" @operator
  "=>" @operator)

(union_type
  "|" @operator)

(type_expr
  "->" @operator)

[
  "+"
  "-"
  "*"
  "/"
  "^"
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&&"
  "||"
  "!"
  "="
] @operator

[
  "("
  ")"
] @punctuation.bracket

"," @punctuation.delimiter

(integer) @number
(float) @number.float
(boolean) @constant.builtin

(variant
  name: (identifier) @constructor)

(let_binding
  name: (bind_pattern
    (identifier) @variable.definition))

(tuple_bind_pattern
  (bind_pattern
    (identifier) @variable.definition))

(let_binding
  parameter: (identifier) @variable.parameter)

(lambda_expression
  (pattern (identifier) @variable.parameter))

(match_arm
  pattern: (pattern (identifier) @variable.definition))

(atom (identifier) @variable)

((atom (identifier) @constructor)
  (#match? @constructor "^[A-Z]"))

((match_arm
  pattern: (pattern (identifier) @constructor))
  (#match? @constructor "^[A-Z]"))

(type_atom (identifier) @type)
