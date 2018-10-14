open StringHelpers

let test () =
    assert (head "" = None);
    assert (head "wow" = Some 'w');

    assert (tail "wow" = "ow");
    assert (tail "" = "");
    assert (tail "w" = "");

    assert (de_cons "wow" = Some ('w', "ow"));
    assert (de_cons "w" = Some ('w', ""));
    assert (de_cons "" = None);

    assert (last "wow" = Some 'w');
    assert (last "" = None);

    assert (to_list "" = []);
    assert (to_list "wow" = ['w'; 'o'; 'w']);
