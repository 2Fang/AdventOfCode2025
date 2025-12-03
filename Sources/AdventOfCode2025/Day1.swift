
struct Day1 {
    private let instructions: [Instruction]

    init(input: String) {
        var instructions: [Instruction] = []
        for instruction in input.split(separator: "\n") {
            instructions.append(Day1.formatInstruction(String(instruction)))
        }
        self.instructions = instructions
    }

    func computeZeroes() -> Int {
        var counter = 0
        var currentNode = 50

        for instruction in instructions {
            currentNode += instruction.direction * instruction.distance
            currentNode = ((currentNode % 100) + 100) % 100
            if currentNode == 0 {
                counter += 1
            }
        }
        return counter
    }
    
    func computerAllZeroes() -> Int {
        var counter = 0
        var currentNode = 50

        for instruction in instructions {
            if currentNode == 0 && instruction.direction == -1 {
                currentNode = 100
            }
            currentNode += instruction.direction * (instruction.distance % 100)
            if currentNode <= 0 || currentNode >= 100 {
                counter += 1
            }
            if instruction.distance > 100 {
                counter += instruction.distance / 100
            }
            currentNode = ((currentNode % 100) + 100) % 100
        }
        return counter
    }

    private static func formatInstruction(_ instruction: String) -> Instruction {
        let direction: Int
        let distance: Int
        if instruction.first! == "L" {
            direction = -1
        } else {
            direction = 1
        }
        distance = Int(instruction.dropFirst())!
        return Instruction(direction: direction, distance: distance)
    }

    private struct Instruction {
        let direction: Int
        let distance: Int
    }

}
