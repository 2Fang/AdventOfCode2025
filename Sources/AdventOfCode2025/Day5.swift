class Day5 {
    var ranges: [[Int]]
    var ingredients: [Int]

    init(input: String) {
        ranges = []
        ingredients = []
        for line in input.split(separator: "\n") {
            if line.contains("-") {
                let nums = line.split(separator: "-")
                var range: [Int] = []
                for num in nums {
                    range.append(Int(num)!)
                }
                ranges.append(range)
            } else if let num = Int(line) {
                ingredients.append(num)
            }
        }
        resolveRanges()
    }

    private func resolveRanges() {
        ranges.sort(by: { $0.first! < $1.first!} )
        var newRanges: [[Int]] = []
        for range in ranges {
            var addRange = true
            for i in newRanges.indices {
                let newRange = newRanges[i]
                if overlapExists(range: range, newRange: newRange) {
                    addRange = false
                    newRanges[i] = [min(range.first!, newRange.first!), max(range.last!, newRange.last!)]
                    break
                }
            }
            if addRange {
                newRanges.append(range)
            }
        }
        newRanges.sort(by: { $0.first! < $1.first!} )
        ranges = newRanges
    }

    private func overlapExists(range: [Int], newRange: [Int]) -> Bool {
        return (range.first! <= newRange.first! && range.last! >= newRange.first!) ||
        (newRange.first! <= range.first! && newRange.last! >= range.first!) ||
        (range.last! >= newRange.last! && range.first! <= newRange.last!) ||
        (newRange.last! >= range.last! && newRange.first! <= range.last!)
    }

    func findFreshIngredients() -> Int {
        var count = 0
        for ingredient in ingredients {
            if let potentialRange = ranges.first(where: { $0.last! >= ingredient }) {
                if ingredient >= potentialRange.first! {
                    count += 1
                }
            }
        }
        return count
    }

    func howManyFreshIngredients() -> Int {
        var count = 0
        for range in ranges {
            count += range.last! - range.first! + 1
        }
        return count
    }
}
