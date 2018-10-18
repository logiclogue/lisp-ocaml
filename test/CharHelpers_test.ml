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

    assert ('A' |> is_letter);
    assert ('Z' |> is_letter);
    assert ('a' |> is_letter);
    assert ('z' |> is_letter);
    assert ('1' |> is_letter |> not);

    assert ('a' |> is_spacer |> not);
    assert ('z' |> is_spacer |> not);
    assert ('A' |> is_spacer |> not);
    assert ('1' |> is_spacer |> not);
    assert (' ' |> is_spacer |> not);
    assert ('-' |> is_spacer);
    assert ('_' |> is_spacer);
