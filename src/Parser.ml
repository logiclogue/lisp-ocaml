type 'a parser = Parser of (string -> ('a * string) list)

let parse : 'a parser -> string -> ('a * string) list =
    function (Parser p) -> p

let item : char parser =
    Parser (function
        | "" -> []
        | s  -> [StringHelpers.head_unsafe s, StringHelpers.tail s])

let look : string parser =
    Parser (fun ts -> [(ts, ts)])

let eof : unit parser =
    Parser (function
        | "" -> [((), "")]
        | _  -> [])

let fmap : ('a -> 'b) -> 'a parser -> 'b parser =
    fun f -> function (Parser px) ->
        Parser (fun ts -> px ts |> List.map (fun (x, ts') -> (f x, ts')))

let (<$>) : ('a -> 'b) -> 'a parser -> 'b parser = fmap

let (<$) : 'b -> 'a parser -> 'b parser = fun x -> fmap (fun _ -> x)

let skip : 'a parser -> unit parser =
    fun px -> () <$ px

let pure : 'a -> 'a parser =
    fun x -> Parser (fun ts -> [(x, ts)])
