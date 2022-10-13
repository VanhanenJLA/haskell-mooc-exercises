function runTest {
    $test = "./Tests/" + $args[0]
    Write-Output "-- Running $test --";
    stack runhaskell $test;
    Write-Output "";
}

$part1Tests = @(
    "Set1Test.hs"
    "Set2aTest.hs"
    "Set2bTest.hs"
    "Set3aTest.hs"
    "Set3bTest.hs"
    "Set4aTest.hs"
    "Set4bTest.hs"
    "Set5aTest.hs"
    "Set5bTest.hs"
    "Set6Test.hs"
    "Set7Test.hs"
    "Set8Test.hs"
)

$part2Tests = @(
    "Set9aTest.hs"
    "Set9bTest.hs"
    "Set10aTest.hs"
    "Set10bTest.hs"
    "Set11aTest.hs"
    "Set11bTest.hs"
    "Set12Test.hs"
    "Set13aTest.hs"
    "Set13bTest.hs"
    "Set14aTest.hs"
    "Set14bTest.hs"
    "Set15Test.hs"
    "Set16aTest.hs"
    "Set16bTest.hs"
)

$allTests = & {
    $part1Tests
    $part2Tests
}

foreach ($test in $allTests) {
    runTest $test;
}