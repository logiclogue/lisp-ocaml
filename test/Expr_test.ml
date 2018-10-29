open Expr

let test () =
    let add1 = match List.find_opt (fun (s, _) -> s == "add1") prelude with
        | Some (_, Function f) -> f
        | _                    -> fun x -> x
        in

    assert ((add1 (Int 1)) = Int 2);
