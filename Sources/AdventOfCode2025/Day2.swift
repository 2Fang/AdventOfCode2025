struct Day2 {
    let allIDs: [Int]

    init(input: String) {
        var allIDs: [Int] = []
        let ranges = input.split(separator: ",")
        for range in ranges {
            let nums = range.split(separator: "-")
            for num in Int(nums.first!)!...Int(nums.last!)! {
                allIDs.append(num)
            }
        }
        self.allIDs = allIDs
    }

    func sumOfInvalidIDs() -> Int {
        var invalidIDs: [Int] = []
        for id in allIDs {
            if !isValidID(id) {
                invalidIDs.append(id)
            }
        }
        return invalidIDs.reduce(0, +)
    }

    func sumOfSuperInvalidIDs() -> Int {
        var superInvalidIDs: [Int] = []
        for id in allIDs {
            if isRepeatingID(id) {
                superInvalidIDs.append(id)
            }
        }
        return superInvalidIDs.reduce(0, +)
    }

    private func isValidID(_ id: Int) -> Bool {
        let strID = String(id)
        if strID.count % 2 == 1 { return true}
        let midway = strID.index(strID.startIndex, offsetBy: strID.count / 2)
        let firstHalf = strID[strID.startIndex..<midway]
        let secondHalf = strID[midway...]
        if firstHalf == secondHalf { return false }
        return true
    }

    private func isRepeatingID(_ id: Int) -> Bool {
        let strID = String(id)
        let count = strID.count
        for i in 1..<count {
            if count % i != 0 { continue }
            let pattern = strID[strID.startIndex...(strID.index(strID.startIndex, offsetBy: i-1))]
            var repeating = true
            for j in 1..<(count / i) {
                let substring = strID[
                    (strID.index(strID.startIndex, offsetBy: j * i))..<(strID.index(strID.startIndex, offsetBy: (j+1) * i))
                ]
                if pattern != substring {
                    repeating = false
                    break
                }
            }
            if repeating { return true }
        }
        return false
    }
}
