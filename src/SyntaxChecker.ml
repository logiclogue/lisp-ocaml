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

let check_name s =
    let is_valid_leading_char c = CharHelpers.is_letter c
        || CharHelpers.is_spacer c in

    let is_valid_char c = is_valid_leading_char c || CharHelpers.is_digit c in

    let rec check_rest_of_name cs =
        match cs with
        | (c :: cs) -> is_valid_char c && check_rest_of_name cs
        | []        -> true
        in

    match s with
    | (c :: cs) -> (is_valid_leading_char c) && check_rest_of_name cs
    | []        -> false
