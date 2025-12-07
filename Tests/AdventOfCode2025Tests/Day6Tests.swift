import Testing
import Foundation
@testable import AdventOfCode2025

struct Day6Tests {

    @Test(
        arguments: [day6DummyCase, day6DummyCase2, day6DummyCase3, day6TestCase]
        )
    func challenge6(testCase: AdventTestCase) {

        let day6 = Day6(input: testCase.input)
        let result1 = day6.solveHomework()
        #expect(result1 == testCase.answer1)
        let result2 = day6.solveCephalopodHomework()
        #expect(result2 == testCase.answer2)

    }

}

let day6DummyCase: AdventTestCase = .init(input: """
    2 3 4
    2 3 4
    2 3 4
    * + + 
    """, answer1: 29, answer2: 999)

let day6DummyCase2: AdventTestCase = .init(input: """
    12 0  4 30
    33 29 3 1 
    +  *  + *  
    """, answer1: 82, answer2: 97)

let day6DummyCase3: AdventTestCase = .init(input: """
    123 328  51 64 
     45 64  387 23 
      6 98  215 314
    *   +   *   +   
    """, answer1: 4277556, answer2: 3263827)
