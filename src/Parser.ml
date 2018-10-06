let parse_expr input =
    match input with
    | "a" -> Expr.A
    | "b" -> Expr.B
    | _   -> Expr.Invalid
