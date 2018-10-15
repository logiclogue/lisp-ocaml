let check_string s =
    let after_open_quote _cs = true in

    match s with
    | []        -> false
    | (c :: cs) -> c == '"' && after_open_quote cs

let check_int s = false
