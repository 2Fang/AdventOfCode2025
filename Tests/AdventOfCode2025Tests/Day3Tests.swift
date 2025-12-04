import Testing
import Foundation
@testable import AdventOfCode2025

struct Day3Tests {

    @Test(
        arguments: [day3DummyCase, day3DummyCase2, day3TestCase]
    )
    func challenge3(testCase: AdventTestCase) {

        let day3 = Day3(input: testCase.input)
        let result1 = day3.maximumVoltage(cellsRequired: 2)
        #expect(result1 == testCase.answer1)
        let result2 = day3.maximumVoltage(cellsRequired: 12)
        #expect(result2 == testCase.answer2)

    }

}

let day3DummyCase: AdventTestCase = .init(input: "818181911112111", answer1: 92, answer2: 888911112111)

let day3DummyCase2: AdventTestCase = .init(input: """
    987654321111111
    811111111111119
    234234234234278
    """, answer1: 265, answer2: 2232999666508)
