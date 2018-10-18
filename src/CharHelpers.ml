let is_digit c =
    match c with
    | '0' -> true
    | '1' -> true
    | '2' -> true
    | '3' -> true
    | '4' -> true
    | '5' -> true
    | '6' -> true
    | '7' -> true
    | '8' -> true
    | '9' -> true
    | _   -> false

let is_lowercase_letter c =
    let code = Char.code c in

    code >= 97 && code <= 122

let is_uppercase_letter c =
    let code = Char.code c in

    code >= 65 && code <= 90

let is_letter c =
    is_lowercase_letter c || is_uppercase_letter c
