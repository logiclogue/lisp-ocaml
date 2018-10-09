let test testF fileName =
    Printf.printf "Testing %s\n" fileName;

    testF ();

    Printf.printf "%s pass\n" fileName

let () =
    test Helpers_test.test "Helpers";

    Printf.printf "All tests pass!\n";
