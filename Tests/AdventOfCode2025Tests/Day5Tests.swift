import Testing
import Foundation
@testable import AdventOfCode2025

struct Day5Tests {

    @Test(
        arguments: [day5DummyCase, day5DummyCase2, day5DummyCase3, day5TestCase]
        )
    func challenge5(testCase: AdventTestCase) {

        let day5 = Day5(input: testCase.input)
        let result1 = day5.findFreshIngredients()
        #expect(result1 == testCase.answer1)
        let result2 = day5.howManyFreshIngredients()
        #expect(result2 == testCase.answer2)

    }

}

let day5DummyCase: AdventTestCase = .init(input: """
    40-50
    10-20
    
    12
    23
    20
    40
    """, answer1: 3, answer2: 22)

let day5DummyCase2: AdventTestCase = .init(input: """
    20-50
    35-40
    120-150
    125-130
    
    34
    131
    100
    """, answer1: 2, answer2: 62)

let day5DummyCase3: AdventTestCase = .init(input: """
    3-5
    10-14
    16-20
    12-18
    
    1
    5
    8
    11
    17
    32
    """, answer1: 3, answer2: 14)
