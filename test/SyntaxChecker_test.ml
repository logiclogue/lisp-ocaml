open SyntaxChecker

let f = StringHelpers.to_list

let test () =
    assert (f "\"sldfj\"" |> check_string);
    assert (f "\"\"" |> check_string);
    assert (f "alskdjf" |> check_string |> not);
    assert (f "" |> check_string |> not);
    assert (f "\"" |> check_string |> not);
    assert (f "\"\"\"" |> check_string |> not);
    assert (f "\"wow\"12" |> check_string |> not);

    assert (f "1123123" |> check_int);
    assert (f "1" |> check_int);
    assert (f "12" |> check_int);
    assert (f "12 " |> check_int |> not);
    assert (f "wow" |> check_int |> not);
    assert (f "" |> check_int |> not);
    assert (f "123abc" |> check_int |> not);

    assert (f "wow" |> check_name);
    assert (f "Wow" |> check_name);
    assert (f "wow-wow" |> check_name);
    assert (f "wow_wow" |> check_name);
    assert (f "wow12" |> check_name);
    assert (f "12wow12" |> check_name |> not);
    assert (f "wow^wow" |> check_name |> not);
    assert (f "wow wow" |> check_name |> not);
