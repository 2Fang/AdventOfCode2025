import Testing
import Foundation
@testable import AdventOfCode2025

struct Day2Tests {

    @Test(
        arguments: [day2DummyCase, day2DummyCase2, day2TestCase]
    )
    func challenge2(testCase: AdventTestCase) {

        let day2 = Day2(input: testCase.input)
        let result1 = day2.sumOfInvalidIDs()
        #expect(result1 == testCase.answer1)
        let result2 = day2.sumOfSuperInvalidIDs()
        #expect(result2 == testCase.answer2)

    }

}

let day2DummyCase: AdventTestCase = .init(input: "11-22", answer1: 33, answer2: 33)

let day2DummyCase2: AdventTestCase = .init(input: "222220-222224,446443-446449", answer1: 668668, answer2: 668668)
