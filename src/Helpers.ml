let head s = match s with
    | "" -> None
    | _  -> Some (String.get s 0)

let tail s = match s with
    | "" -> None
    | _  -> Some (String.sub s 1 (String.length s - 1))
