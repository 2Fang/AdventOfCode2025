import math_h

struct Day6 {
    var numbers: [[String]]
    var operations: [String]

    init(input: String) {
        numbers = []
        operations = input.split(separator: "\n").last!.split(separator: " ").map(\.description)

        let lastLine = input.split(separator: "\n").last!
        var numberWidths: [Int] = []
        for char in lastLine {
            if char == "+" || char == "*" {
                numberWidths.append(0)
            } else {
                numberWidths[numberWidths.count - 1] += 1
            }
        }
        for line in input.split(separator: "\n") {
            if line.first == "*" || line.first == "+" {
                break
            }
            var counter = 0
            var part: [String] = []
            for width in numberWidths {
                part.append(String(line[line.index(line.startIndex, offsetBy: counter)...line.index(line.startIndex, offsetBy: counter+width-1)]))
                counter += width + 1
            }
            numbers.append(part)
        }
    }

    func solveHomework() -> Int {
        var answers: [Int] = []
        for i in 0..<operations.count {
            if operations[i] == "+" {
                var answer = 0
                for j in 0..<numbers.count {
                    answer += Int(trimWhiteSpace(numbers[j][i]))!
                }
                answers.append(answer)
            } else if operations[i] == "*" {
                var answer = 1
                for j in 0..<numbers.count {
                    answer *= Int(trimWhiteSpace(numbers[j][i]))!
                }
                answers.append(answer)
            }
        }
        return answers.reduce(0, +)
    }

    func solveCephalopodHomework() -> Int {
        var answers: [Int] = []
        for i in 0..<operations.count {
            if operations[i] == "+" {
                var answer = 0
                for k in 0..<numbers[0][i].count {
                    var strNum = ""
                    for j in 0..<numbers.count {
                        strNum += String(numbers[j][i][numbers[j][i].index(numbers[j][i].startIndex, offsetBy: k)])
                    }
                    answer += Int(trimWhiteSpace(strNum))!
                }
                answers.append(answer)
            } else if operations[i] == "*" {
                var answer = 1
                for k in 0..<numbers[0][i].count {
                    var strNum = ""
                    for j in 0..<numbers.count {
                        strNum += String(numbers[j][i][numbers[j][i].index(numbers[j][i].startIndex, offsetBy: k)])
                    }
                    answer *= Int(trimWhiteSpace(strNum))!
                }
                answers.append(answer)
            }
        }
        return answers.reduce(0, +)
    }

    private func trimWhiteSpace(_ num: String) -> String {
        var answer = ""
        for char in num {
            if char != " " {
                answer.append(char)
            }
        }
        return answer
    }
}
