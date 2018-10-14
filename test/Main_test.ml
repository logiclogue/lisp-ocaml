let test testF fileName =
    Printf.printf "Testing %s\n" fileName;

    testF ();

    Printf.printf "%s pass\n" fileName

let () =
    test ListHelpers_test.test "ListHelpers";
    test StringHelpers_test.test "StringHelpers";
    (*test SyntaxChecker_test.test "SyntaxChecker";*)

    Printf.printf "All tests pass!\n";
