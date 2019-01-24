
import Foundation

/**
 Insert Interval
 
 Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).
 
 You may assume that the intervals were initially sorted according to their start times.
 
 Example 1:
 Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
 Output: [[1,5],[6,9]]
 
 Example 2:
 Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
 Output: [[1,2],[3,10],[12,16]]
 Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
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

func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
    if intervals.isEmpty { return [newInterval] }
    var ret = [Interval]()
    var addedNew = false
    for i in 0..<intervals.count {
        let cur = intervals[i]
        if cur.end < newInterval.start {
            ret.append(cur)
        } else if cur.start > newInterval.end {
            if !addedNew {
                addedNew = true
                ret.append(newInterval)
            }
            ret.append(cur)
        } else { // 交叉
            newInterval.start = min(newInterval.start, cur.start)
            newInterval.end = max(newInterval.end, cur.end)
        }
    }
    if !addedNew { ret.append(newInterval) }
    return ret
}

let intervals1 = [
    Interval(1, 3),
    Interval(6, 9)
]
print(insert(intervals1, Interval(2, 5)))

let intervals2 = [
    Interval(1, 2),
    Interval(3, 5),
    Interval(6, 7),
    Interval(8, 10),
    Interval(12, 16),
]
print(insert(intervals2, Interval(4, 8)))
