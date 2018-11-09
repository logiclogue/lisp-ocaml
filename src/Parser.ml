type 'a parser = Parser of (string -> ('a * string) list)

let parse : 'a parser -> string -> ('a * string) list =
    function (Parser p) -> p
