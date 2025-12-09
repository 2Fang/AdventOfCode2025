import Testing
@testable import AdventOfCode2025

struct Day8Tests {

    @Test(
        arguments: [day8DummyCase, day8DummyCase2, day8TestCase]
        )
    func challenge8(testCase: AdventTestCase8) {

        let day8 = Day8(input: testCase.input)
        let result1 = day8.connectNetwork(after: testCase.x)
        #expect(result1 == testCase.answer1)
        let result2 = day8.findLastConnectionDistance()
        #expect(result2 == testCase.answer2)

    }

}

struct AdventTestCase8 {
    let input: String
    let answer1: Int
    let answer2: Int
    let x: Int
}

let day8DummyCase: AdventTestCase8 = .init(input: """
    0,0,0
    1,1,1
    0,1,1
    4,4,4
    9,9,9
    """, answer1: 3, answer2: 36, x: 3)

let day8DummyCase2: AdventTestCase8 = .init(input: """
    162,817,812
    57,618,57
    906,360,560
    592,479,940
    352,342,300
    466,668,158
    542,29,236
    431,825,988
    739,650,466
    52,470,668
    216,146,977
    819,987,18
    117,168,530
    805,96,715
    346,949,466
    970,615,88
    941,993,340
    862,61,35
    984,92,344
    425,690,689
    """, answer1: 40, answer2: 25272, x: 10)
