
import Foundation

/**
 Max Points on a Line
 
 Given n points on a 2D plane, find the maximum number of points that lie on the same straight line.
 
 Example 1:
 Input: [[1,1],[2,2],[3,3]]
 Output: 3
 Explanation:
 ^
 |
 |        o
 |     o
 |  o
 +------------->
 0  1  2  3  4

 Example 2:
 Input: [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
 Output: 4
 Explanation:
 ^
 |
 |  o
 |     o        o
 |        o
 |  o        o
 +------------------->
 0  1  2  3  4  5  6
 */

class Point {
    var x: Int
    var y: Int
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func maxPoints(_ points: [Point]) -> Int {
    guard points.count > 2 else {
        return points.count
    }
    
    var maxNum = 0
    
    for i in 0 ..< points.count {
        // 处理相同的点
        var samed = 1
        for j in 0 ..< points.count {
            if i == j { continue }
            let p1 = points[i]
            let p2 = points[j]
            if p1.x == p2.x && p1.y == p2.y {
                samed += 1
            }
        }
        var map = [Double: Int]()
        if samed > 1 {
            map[Double.nan] = samed
        }
        // 处理不同的点
        for j in 0 ..< points.count {
            if i == j { continue }
            let p1 = points[i]
            let p2 = points[j]
            if p1.x == p2.x && p1.y == p2.y { continue }
            let ratio = Double(p1.x - p2.x) / Double(p1.y - p2.y)
            if let count = map[ratio] {
                map[ratio] = count + 1
            } else {
                map[ratio] = samed + 1
            }
        }
        // 求最大个数
        maxNum = max(maxNum, map.values.reduce(0, { return $1 > $0 ? $1 : $0 }))
    }
    
    return maxNum
}


//Input: [[1,1],[2,2],[3,3]]
//Output: 3
let p11 = Point(1, 1)
let p12 = Point(2, 2)
let p13 = Point(3, 3)
maxPoints([p11, p12, p13])

//Input: [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
//Output: 4
let p21 = Point(1, 1)
let p22 = Point(3, 2)
let p23 = Point(5, 3)
let p24 = Point(4, 1)
let p25 = Point(2, 3)
let p26 = Point(1, 4)
maxPoints([p21, p22, p23, p24, p25, p26])

//Input: [[0,0],[1,1],[0,0]]
//Output: 3
let p31 = Point(0, 0)
let p32 = Point(1, 1)
let p33 = Point(0, 0)
maxPoints([p31, p32, p33])

//Input: [[1,1],[1,1],[1,1]]
//Output: 3
let p41 = Point(1, 1)
let p42 = Point(1, 1)
let p43 = Point(1, 1)
maxPoints([p41, p42, p43])
