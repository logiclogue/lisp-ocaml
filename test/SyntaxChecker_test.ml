open SyntaxChecker

let test () =
    assert (check_string "sldfj");
    assert (check_string "");

    assert (check_int "12");
