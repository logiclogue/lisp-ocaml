open StringHelpers

let test () =
    assert (head "" = None);
    assert (head "wow" = Some 'w');

    assert (tail "wow" = "ow");
    assert (tail "" = "");
    assert (tail "w" = "");

    assert (last "wow" = Some 'w');
    assert (last "" = None);

    assert (to_list "" = []);
    assert (to_list "wow" = ['w'; 'o'; 'w']);
