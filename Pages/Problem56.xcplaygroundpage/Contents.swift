
import Foundation

/**
 Merge Intervals
 
 Given a collection of intervals, merge all overlapping intervals.
 
 Example 1:
 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 
 Example 2:
 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 */

class Interval: NSObject {
    var start: Int
    var end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
    override var description: String {
        return "[\(self.start),\(self.end)]"
    }
}

func merge(_ intervals: [Interval]) -> [Interval] {
    if intervals.count <= 1 { return intervals }
    var sorted = intervals.sorted(by: { $0.start < $1.start } )
    var ret = [Interval]()
    var curStart = sorted[0].start
    var curEnd = sorted[0].end
    for i in 1..<sorted.count {
        let cur = sorted[i]
        if cur.start <= curEnd {
            curEnd = max(curEnd, cur.end)
        } else {
            ret.append(Interval(curStart, curEnd))
            curStart = cur.start
            curEnd = cur.end
        }
    }
    ret.append(Interval(curStart, curEnd))
    return ret
}

let intervals1 = [
    Interval(1, 3),
    Interval(2, 6),
    Interval(8, 10),
    Interval(15, 18)
    ]
print(merge(intervals1))

let intervals2 = [
    Interval(1, 4),
    Interval(4, 5)
]
print(merge(intervals2))
