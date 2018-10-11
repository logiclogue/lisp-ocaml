open Helpers

let f = string_to_list

let test () =
    assert (head (f "") = None);
    assert (head (f "wow") = Some 'w');

    assert (tail (f "wow") = Some (f "ow"));
    assert (tail (f "") = None);
    assert (tail (f "w") = Some (f ""));

    assert (last (f "") = None);
    assert (last (f "wow") = Some 'w');
    assert (last (f "wo") = Some 'o');

    assert (cons "wow" = Some ('w', "ow"));
    assert (cons "" = None);

    assert (string_to_list "" = []);
    assert (string_to_list "wow" = ['w'; 'o'; 'w']);
