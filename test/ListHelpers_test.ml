open Helpers

let f = StringHelpers.to_list

let test () =
    assert (head (f "") = None);
    assert (head (f "wow") = Some 'w');

    assert (tail (f "wow") = Some (f "ow"));
    assert (tail (f "") = None);
    assert (tail (f "w") = Some (f ""));

    assert (last (f "") = None);
    assert (last (f "wow") = Some 'w');
    assert (last (f "wo") = Some 'o');
