import math_h

struct Day3 {
    let banks: [[Int]]

    init(input: String) {
        var banks: [[Int]] = []
        for line in input.split(separator: "\n") {
            var bank: [Int] = []
            for char in line {
                bank.append(Int("\(char)")!)
            }
            banks.append(bank)
        }
        self.banks = banks
    }

    func maximumVoltages() -> Int {
        var total = 0
        for bank in banks {
            var highestCell = 0
            for cell in 0..<bank.count - 1 {
                if bank[cell] > bank[highestCell] {
                    highestCell = cell
                }
            }
            var nextHighestCell = highestCell + 1
            for cell in highestCell + 1..<bank.count {
                if bank[cell] > bank[nextHighestCell] {
                    nextHighestCell = cell
                }
            }
            total += bank[highestCell] * 10 + bank[nextHighestCell]
        }
        return total
    }

    func maximumVoltage(cellsRequired: Int) -> Int {
        var total = 0
        for bank in banks {
            var highestCells: [Int] = []
            for iteration in 1...cellsRequired {
                let prevCellIndex = highestCells.last ?? -1
                var highestCell = prevCellIndex + 1
                for cell in (prevCellIndex + 1)..<bank.count - (cellsRequired - iteration) {
                    if bank[cell] > bank[highestCell] {
                        highestCell = cell
                    }
                }
                highestCells.append(highestCell)
            }
            for cell in 0..<highestCells.count {
                total += bank[highestCells[cell]] * Int(pow(10, Double(highestCells.count - (cell + 1))))
            }
        }
        return total
    }
}
