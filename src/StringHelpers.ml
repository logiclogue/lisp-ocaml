let head s = match s with
    | "" -> None
    | _  -> Some (String.get s 0)

let tail s = match s with
    | "" -> None
    | _  -> Some (String.sub s 1 (String.length s - 1))

let cons s = match head s with
    | None   -> None
    | Some c -> match tail s with
        | None   -> None
        | Some t -> Some (c, t)

let rec to_list s = match cons s with
    | None         -> []
    | Some (c, cs) -> c :: to_list cs
