let check_string =
    let after_escape = function
        | (c :: cs) -> cs
        | []        -> []
        in

    let rec after_quote = function
        | ('"' :: [])  -> true
        | ('\\' :: cs) -> after_escape cs |> after_quote
        | ('"' :: cs)  -> false
        | (c :: cs)    -> after_quote cs
        | []           -> false
        in

    function
    | ('"' :: cs) -> after_quote cs
    | _           -> false

let rec check_int = function
    | (c :: []) -> CharHelpers.is_digit c
    | (c :: cs) -> CharHelpers.is_digit c && check_int cs
    | []        -> false

let check_name =
    let is_valid_leading_char c = CharHelpers.is_letter c
        || CharHelpers.is_spacer c in

    let is_valid_char c = is_valid_leading_char c || CharHelpers.is_digit c in

    let rec check_rest_of_name = function
        | (c :: cs) -> is_valid_char c && check_rest_of_name cs
        | []        -> true
        in

    function
    | (c :: cs) -> (is_valid_leading_char c) && check_rest_of_name cs
    | []        -> false

let rec list_splitter = function
    | ('(' :: cs) -> "(" :: (list_splitter cs)
    | (')' :: []) -> [")"]
    | (c :: cs)   -> "c" :: (list_splitter cs)
    | []          -> []
