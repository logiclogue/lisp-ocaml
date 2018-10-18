open SyntaxChecker

let f = StringHelpers.to_list

let test () =
    assert (f "\"sldfj\"" |> check_string);
    assert (f "\"\"" |> check_string);
    assert (not (f "alskdjf" |> check_string));
    assert (not (f "" |> check_string));
    assert (not (f "\"" |> check_string));
    assert (not (f "\"\"\"" |> check_string));
    assert (not (f "\"wow\"12" |> check_string));

    assert (check_int "12");
