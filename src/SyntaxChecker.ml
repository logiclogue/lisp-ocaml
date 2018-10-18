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
    match s with
    | (c :: []) -> CharHelpers.is_digit c
    | (c :: cs) -> CharHelpers.is_digit c && check_int cs
    | []        -> false

let check_name s = false
