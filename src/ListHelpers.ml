let head s = match s with
    | []        -> None
    | (x :: xs) -> Some x

let tail s = match s with
    | []        -> None
    | (x :: xs) -> Some xs

let rec last s = match s with
    | []        -> None
    | (x :: []) -> Some x
    | (x :: xs) -> last xs

let inline =
    let f c = match c with
        | '\n'   -> ' '
        | '\012' -> ' '
        | '\t'   -> ' '
        | '\r'   -> ' '
        | c      -> c
        in

    List.map f

let rec trim_front s = match s with
    | []          -> []
    | (' ' :: xs) -> trim_front xs
    | xs          -> xs
