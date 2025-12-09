import math_h

struct Day8 {
    private var boxes: [Box]

    init(input: String) {
        boxes = []
        for coord in input.split(separator: "\n") {
            boxes.append(Box(coord: String(coord)))
        }
    }

    func connectNetwork(after x: Int) -> Int {
        var connections: [Connection] = []
        for i in 0..<boxes.count {
            for j in (i+1)..<boxes.count {
                connections.append(Connection(boxes: [i, j], distance: boxes[i].distance(to: boxes[j])))
            }
        }
        connections.sort { $0.distance < $1.distance }
        let lastX = connections.count - x
        if lastX > 0 {
            connections.removeLast(lastX)
        }
        var groups: [Set<Int>] = []
        for connection in connections {
            var foundGroups: [Int] = []
            for i in groups.indices {
                if groups[i].contains(connection.boxes[0]) || groups[i].contains(connection.boxes[1]) {
                    foundGroups.append(i)
                }
            }
            if foundGroups.count == 0 {
                groups.append([connection.boxes[0], connection.boxes[1]])
            } else {
                unionGroups(&groups, at: foundGroups, with: connection.boxes)
            }
        }
        groups.sort { $0.count > $1.count }
        if groups.count < 3 {
            if groups.count < 2 {
                if groups.count < 1 {
                    return 1
                }
                return groups[0].count
            }
            return groups[0].count * groups[1].count
        }
        return groups[0].count * groups[1].count * groups[2].count
    }

    func findLastConnectionDistance() -> Int {
        var connections: [Connection] = []
        for i in 0..<boxes.count {
            for j in (i+1)..<boxes.count {
                connections.append(Connection(boxes: [i, j], distance: boxes[i].distance(to: boxes[j])))
            }
        }
        connections.sort { $0.distance < $1.distance }
        var groups: [Set<Int>] = []
        for connection in connections {
            var foundGroups: [Int] = []
            for i in groups.indices {
                if groups[i].contains(connection.boxes[0]) || groups[i].contains(connection.boxes[1]) {
                    foundGroups.append(i)
                }
            }
            if foundGroups.count == 0 {
                groups.append([connection.boxes[0], connection.boxes[1]])
            } else {
                unionGroups(&groups, at: foundGroups, with: connection.boxes)
                if groups.count == 1 && groups[0].count == boxes.count {
                    return boxes[connection.boxes[0]].point.first! * boxes[connection.boxes[1]].point.first!
                }
            }
        }
        return 0
    }


    private func unionGroups(_ groups: inout [Set<Int>], at indices: [Int], with extra: [Int]) {
        var merged = Set(extra)
        for i in indices {
            merged.formUnion(groups[i])
        }
        for i in indices.sorted(by: >) {
            groups.remove(at: i)
        }
        groups.append(merged)
    }


    private struct Box {
        let point: [Int]

        init(coord: String) {
            point = coord.split(separator: ",").compactMap { Int($0) }
        }

        func distance(to other: Box) -> Double {
            var euclidean: Double = 0
            for i in 0..<point.count {
                let diff = Double(abs(point[i] - other.point[i]))
                euclidean += diff * diff
            }
            return sqrt(euclidean)
        }
    }

    private struct Connection {
        let boxes: [Int]
        let distance: Double
    }
}
