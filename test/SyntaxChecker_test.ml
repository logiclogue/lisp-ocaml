open SyntaxChecker

let f = Helpers.string_to_list

let test () =
    assert (f "\"sldfj\"" |> check_string);
    assert (f "\"\"" |> check_string);
    assert (not (f "alskdjf" |> check_string));
    assert (not (f "" |> check_string));
    assert (not (f "\"" |> check_string));
    assert (not (f "\"\"\"" |> check_string));

    assert (check_int "12");
