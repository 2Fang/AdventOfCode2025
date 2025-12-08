struct Day7 {
    var tachyonGrid: [[String]]

    init(input: String) {
        tachyonGrid = []
        for line in input.split(separator: "\n") {
            tachyonGrid.append(Array(line).map(String.init))
        }
    }

    func findNoOfSplits() -> Int {
        var splits = 0
        var tachyonGrid = self.tachyonGrid
        for row in 1..<tachyonGrid.count {
            for column in 0..<tachyonGrid[row].count {
                if tachyonGrid[row-1][column] == "|" || tachyonGrid[row-1][column] == "S" {
                    if tachyonGrid[row][column] == "." {
                        tachyonGrid[row][column] = "|"
                    } else if tachyonGrid[row][column] == "^" {
                        if column - 1 >= 0 {
                            tachyonGrid[row][column - 1] = "|"
                        }
                        if column + 1 < tachyonGrid[row].count {
                            tachyonGrid[row][column + 1] = "|"
                        }
                        splits += 1
                    }
                }
            }
        }
        return splits
    }

    func findAlternateTimelines() -> Int {
        var tachyonGrid = self.tachyonGrid
        for row in 1..<tachyonGrid.count {
            for column in 0..<tachyonGrid[row].count {
                if tachyonGrid[row-1][column] == "S" {
                    tachyonGrid[row][column] = "1"
                }
                if let number = Int(tachyonGrid[row-1][column]) {
                    if tachyonGrid[row][column] == "^" {
                        if column - 1 >= 0 {
                            tachyonGrid[row][column - 1] = String(number + (Int(tachyonGrid[row][column - 1]) ?? 0))
                        }
                        if column + 1 < tachyonGrid[row].count {
                            tachyonGrid[row][column + 1] = String(number + (Int(tachyonGrid[row][column + 1]) ?? 0))
                        }
                    } else {
                        tachyonGrid[row][column] = String(number + (Int(tachyonGrid[row][column]) ?? 0))
                    }
                }
            }
        }
        return tachyonGrid[tachyonGrid.count-1].compactMap { Int($0) }.reduce(0, +)
    }
}
