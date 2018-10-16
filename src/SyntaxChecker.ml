let check_string s =
    let rec after_open_quote cs = match cs with
        | ('"' :: []) -> true
        | (c :: cs)   -> after_open_quote cs
        | ([])        -> false
        in

    match s with
    | []        -> false
    | (c :: cs) -> c == '"' && after_open_quote cs

let check_int s = false
