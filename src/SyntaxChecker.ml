let check_string s =
    let inside_is_valid _cs = true in

    match s with
    | []        -> false
    | (c :: cs) -> c == '"' && inside_is_valid cs

let check_int s = false
