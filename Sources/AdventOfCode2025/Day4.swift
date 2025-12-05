class Day4 {
    var grid: [[Character]]
    var adjacencyGrid: [[Int]]
    var removedRolls = 0

    init(input: String) {
        var grid: [[Character]] = []
        let lines = input.split(separator: "\n")
        var row: [Character] = []
        for line in lines {
            for char in line {
                row.append(char)
            }
            grid.append(row)
            row = []
        }
        self.grid = grid
        adjacencyGrid = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        findLiftableRolls()
    }

    private func findLiftableRolls() {
        adjacencyGrid = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        let directions: [(Int, Int)] = [(0, 1), (1, 0), (1, 1), (-1, 1)]
        for row in grid.indices {
            for col in grid[row].indices {
                if grid[row][col] == "@" {
                    for (dx, dy) in directions {
                        let nx = row + dx
                        let ny = col + dy
                        if nx >= 0, nx < grid.count, ny >= 0, ny < grid[row].count {
                            if grid[nx][ny] == "@" {
                                adjacencyGrid[row][col] += 1
                                adjacencyGrid[nx][ny] += 1
                            }
                        }
                    }
                } else {
                    adjacencyGrid[row][col] = -1
                }
            }
        }
    }

    func countLiftableRolls() -> Int {
        print("---")
        for row in adjacencyGrid {
            print(row)
        }
        print("---")
        return adjacencyGrid.reduce(into: 0) { result, row in
            result += row.filter { $0 < 4 && $0 >= 0 }.count
        }
    }

    func keepRemovingRolls() -> Int {
        while true {
            let removedCount = removeRolls()
            findLiftableRolls()
            if removedCount == 0 {
                return removedRolls
            }
            removedRolls += removedCount
        }
    }

    private func removeRolls() -> Int {
        var count = 0
        for row in grid.indices {
            for col in grid[row].indices {
                if grid[row][col] == "@", adjacencyGrid[row][col] < 4 {
                    grid[row][col] = "."
                    count += 1
                }
            }
        }
        return count
    }
}
