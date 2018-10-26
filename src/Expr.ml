type t =
    | Name of string
    | Int of int
    | String of string
    | List of t list
    | Function of (t -> t)

let add1 = function
    | Int x -> Int (x + 1)
    | _     -> Int 0

let prelude = []
    |> (("add1", Function add1) ::)
