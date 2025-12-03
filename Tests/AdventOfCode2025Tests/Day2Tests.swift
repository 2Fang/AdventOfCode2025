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

let day2TestCase: AdventTestCase = .init(input: "824-1475,967620-1012917,2727216511-2727316897,56345-141494,8811120-8999774,5727326-5922513,935306-961989,76751455-76787170,723458-849157,144648-162230,1597-3207,326085-472746,14-34,66-132,9453977670-9454023729,959903262-960027272,17168-26699,190-332,3351-5602,1-11,371280315-371448887,6252062-6312899,9696887156-9697040132,37-58,32770-52161,6443650762-6443689882,473092-582157,3309726-3347079,852735-912990,8294840594-8294926063,3773964-3884030,7718304-7809359,601947-677833,3434304207-3434405118,449-673,64525269-64702774,31545468-31784543,184451-308951,5771-11485", answer1: 52316131093, answer2: 69564213293)
