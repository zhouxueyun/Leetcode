
import Foundation

/**
 Pascal's Triangle
 
 Given a non-negative integer numRows, generate the first numRows of Pascal's triangle.
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 Example:
 
 Input: 5
 Output:
 [
    [1],
    [1,1],
    [1,2,1],
    [1,3,3,1],
    [1,4,6,4,1]
 ]
 */

func generate(_ numRows: Int) -> [[Int]] {
    guard numRows > 0 else { return [] }
    var ret = [[Int]]()
    for i in 0..<numRows {
        if i == 0 {
            ret.append([1])
        } else {
            let last = ret[i-1]
            var curr = [Int]()
            for j in 0...i {
                if j == 0 || j == last.count {
                    curr.append(1)
                } else {
                    curr.append(last[j] + last[j-1])
                }
            }
            ret.append(curr)
        }
    }
    return ret
}

generate(5)
