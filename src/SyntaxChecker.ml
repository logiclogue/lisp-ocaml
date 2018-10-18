let check_string s =
    let rec after_open_quote cs = match cs with
        | ('"' :: [])  -> true
        | ('"' :: cs)  -> false
        | (c :: cs)    -> after_open_quote cs
        | ([])         -> false
        in

    match s with
    | []        -> false
    | (c :: cs) -> c == '"' && after_open_quote cs

let rec check_int s =
    let check_digit c = match c with
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
        in

    match s with
    | (c :: []) -> check_digit c
    | (c :: cs) -> check_digit c && check_int cs
    | []        -> false

let check_name s = false
