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

let cons s = match head s with
    | None   -> None
    | Some c -> match tail s with
        | None   -> None
        | Some t -> Some (c, t)

let rec string_to_list s = match cons s with
    | None         -> []
    | Some (c, cs) -> c :: string_to_list cs
