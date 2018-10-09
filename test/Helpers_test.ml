let test () =
    assert (Helpers.head "" = None);
    assert (Helpers.head "wow" = Some 'w');

    assert (Helpers.tail "wow" = Some "ow");
    assert (Helpers.tail "" = None);
    assert (Helpers.tail "w" = Some "");

    assert (Helpers.cons "wow" = Some ('w', "ow"));
    assert (Helpers.cons "" = None);
