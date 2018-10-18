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

    assert (f "1123123" |> check_int);
    assert (f "1" |> check_int);
    assert (f "12" |> check_int);
    assert (not (f "12 " |> check_int));
    assert (not (f "wow" |> check_int));
    assert (not (f "" |> check_int));
    assert (not (f "123abc" |> check_int));
