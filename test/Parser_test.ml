open Parser

let test () =
    assert (parse item "wow" = [('w', "ow")]);
    assert (parse look "wow" = [("wow", "wow")]);
    assert (parse eof "" = [((), "")]);
    assert (parse (fmap Char.code item) "wow" = [(119, "ow")]);
    assert (parse (Char.code <$> item) "wow" = [(119, "ow")]);
    assert (parse ("$$" <$ item) "wow" = [("$$", "ow")]);
