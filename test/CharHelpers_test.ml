open CharHelpers

let test () =
    assert ('0' |> is_digit);
    assert ('9' |> is_digit);
    assert ('a' |> is_digit |> not);
    assert ('A' |> is_digit |> not);
    assert (';' |> is_digit |> not);

    assert ('a' |> is_lowercase_letter);
    assert ('z' |> is_lowercase_letter);
    assert ('A' |> is_lowercase_letter |> not);
    assert ('Z' |> is_lowercase_letter |> not);
    assert ('1' |> is_lowercase_letter |> not);

    assert ('A' |> is_uppercase_letter);
    assert ('Z' |> is_uppercase_letter);
    assert ('a' |> is_uppercase_letter |> not);
    assert ('z' |> is_uppercase_letter |> not);
    assert ('1' |> is_uppercase_letter |> not);
