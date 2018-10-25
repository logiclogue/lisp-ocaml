type t =
    | Name of string
    | Int of int
    | String of string
    | List of t list
    | Lamda of t * string * t
