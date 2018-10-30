open Expr

let test () =
    let add1 = match List.find (fun (s, _) -> s == "add1") prelude with
        | (_, Function f) -> f
        in

    assert ((add1 (Int 1)) = Int 2);
