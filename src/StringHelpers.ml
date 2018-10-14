let head s = match s with
    | "" -> None
    | _  -> Some (String.get s 0)

let tail s = match s with
    | "" -> ""
    | _  -> String.sub s 1 (String.length s - 1)

let de_cons s = match head s with
    | None   -> None
    | Some c -> Some (c, tail s)

let rec last s = match de_cons s with
    | None         -> None
    | Some (c, "") -> Some c
    | Some (c, cs) -> last cs

let rec to_list s = match de_cons s with
    | None         -> []
    | Some (c, cs) -> c :: to_list cs

let from_list s = String.concat "" (List.map (String.make 1) s)
