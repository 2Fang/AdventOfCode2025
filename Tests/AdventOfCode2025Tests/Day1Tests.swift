import Testing
import Foundation
@testable import AdventOfCode2025

struct Day1Tests {

    @Test(
        arguments: [day1DummyCase, day1DummyCase2, day1TestCase]
    )
    func challenge1(testCase: AdventTestCase) {

        let day1 = Day1(input: testCase.input)
        let result1 = day1.computeZeroes()
        #expect(result1 == testCase.answer1)
        let result2 = day1.computerAllZeroes()
        #expect(result2 == testCase.answer2)

    }

}

struct AdventTestCase {
    let input: String
    let answer1: Int
    let answer2: Int
}

let day1DummyCase: AdventTestCase = .init(input: """
R55
L10
R5
L92
R8
L16
R42
R300
""", answer1: 2, answer2: 7)

let day1DummyCase2: AdventTestCase = .init(input: """
L50
L192
R298
""", answer1: 1, answer2: 5)
