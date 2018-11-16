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

let ( <$> ) : ('a -> 'b) -> 'a parser -> 'b parser = fmap

let ( <$ ) : 'b -> 'a parser -> 'b parser = fun x -> fmap (fun _ -> x)

let skip : 'a parser -> unit parser =
    fun px -> () <$ px

let pure : 'a -> 'a parser =
    fun x -> Parser (fun ts -> [(x, ts)])

let ( <*> ) : ('a -> 'b) parser -> 'a parser -> 'b parser =
    function (Parser pf) -> function (Parser px) ->
        Parser (fun ts -> pf ts
            |> List.map (fun (f, ts') -> px ts'
                |> List.map (fun (x, ts'') -> (f x, ts'')))
            |> List.concat)

let ( <* ) : 'a parser -> 'b parser -> 'a parser =
    fun px py -> (fun x y -> x) <$> px <*> py

let ( *> ) : 'a parser -> 'b parser -> 'b parser =
    fun px py -> (fun x -> x) <$ px <*> py

let ( <**> ) : 'a parser -> ('a -> 'b) parser -> 'b parser =
    fun px pf -> (fun x f -> f x) <$> px <*> pf

(*let ( <:> ) : 'a parser -> 'a list parser -> 'a list parser =
    fun px pxs -> (::) <$*)
