import Testing
import Foundation
@testable import AdventOfCode2025

struct Day4Tests {

    @Test(
        arguments: [day4DummyCase, day4DummyCase2, day4DummyCase3, day4TestCase]
        )
    func challenge4(testCase: AdventTestCase) {

        let day4 = Day4(input: testCase.input)
        let result1 = day4.countLiftableRolls()
        #expect(result1 == testCase.answer1)
        let result2 = day4.keepRemovingRolls()
        #expect(result2 == testCase.answer2)

    }

}

let day4DummyCase: AdventTestCase = .init(input: """
    @.@.@
    .@@@.
    ..@..
    """, answer1: 4, answer2: 7)

let day4DummyCase2: AdventTestCase = .init(input: """
    @@.@@
    @@@.@
    ..@.@
    @.@@@
    """, answer1: 9, answer2: 14)


let day4DummyCase3: AdventTestCase = .init(input: """
    ..@@.@@@@.
    @@@.@.@.@@
    @@@@@.@.@@
    @.@@@@..@.
    @@.@@@@.@@
    .@@@@@@@.@
    .@.@.@.@@@
    @.@@@.@@@@
    .@@@@@@@@.
    @.@.@@@.@.
    """, answer1: 13, answer2: 43)

