assert (Main.head "" = None);
assert (Main.head "wow" = Some 'w');
assert (Main.tail "wow" = Some "ow");
assert (Main.tail "" = None);
assert (Main.tail "w" = Some "");
