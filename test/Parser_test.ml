open Parser

let test () =
    let char_code = pure Char.code in

    assert (parse item "wow" = [('w', "ow")]);
    assert (parse look "wow" = [("wow", "wow")]);
    assert (parse eof "" = [((), "")]);
    assert (parse (fmap Char.code item) "wow" = [(119, "ow")]);
    assert (parse (Char.code <$> item) "wow" = [(119, "ow")]);
    assert (parse ("$$" <$ item) "wow" = [("$$", "ow")]);
    assert (parse (skip item) "wow" = [((), "ow")]);
    assert (parse (pure 42) "wow" = [(42, "wow")]);
    assert (parse (Char.code <$ item <*> item) "wow" = [(111, "w")]);
    assert (parse (Char.code <$ item <* item <*> item) "wow" = [(119, "")]);
    assert (parse ((Char.code <$ item) *> item) "wow" = [('o', "w")]);
    assert (parse (item <**> char_code) "wow" = [(119, "ow")]);
    assert (parse (item <:> pure []) "wow" = [(['w'], "ow")]);
    assert (parse (between item item (Char.code <$> item)) "wow" = [(111, "")]);
    assert (parse unit "wow" = [((), "wow")]);
    assert (parse (mult item (Char.code <$> item)) "wow" = [(('w', 111), "w")]);
    assert (parse (item <~> (Char.code <$> item)) "wow" = [(('w', 111), "w")]);
    assert (parse (item <~ (Char.code <$> item)) "wow" = [('w', "w")]);
    assert (parse ((~>) item (Char.code <$> item)) "wow" = [(111, "w")]);
    assert (parse empty "wow" = []);
    assert (parse (item <|> pure 'j') "wow" = [('w', "ow"); ('j', "wow")]);
    assert (parse (choice [item; pure 'j']) "wo" = [('w', "o"); ('j', "wo")]);
    assert (parse (some item) "wow" = [(['w'; 'o'; 'w'], "")]);
