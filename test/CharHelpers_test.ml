open CharHelpers

let test () =
    assert ('0' |> is_digit);
    assert ('9' |> is_digit);
    assert ('a' |> is_digit |> not);
    assert ('A' |> is_digit |> not);
    assert (';' |> is_digit |> not);
