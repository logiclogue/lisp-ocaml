open StringHelpers

let test () =
    assert (head "" = None);
    assert (head "wow" = Some 'w');

    assert (tail "wow" = Some "ow");
    assert (tail "" = None);
    assert (tail "w" = Some "");

    assert (to_list "" = []);
    assert (to_list "wow" = ['w'; 'o'; 'w']);
