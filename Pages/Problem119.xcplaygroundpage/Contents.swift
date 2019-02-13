
import Foundation

/**
 Pascal's Triangle II
 
 Given a non-negative index k where k ≤ 33, return the kth index row of the Pascal's triangle.
 
 Note that the row index starts from 0.
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it.
 
 Example:
 Input: 3
 Output: [1,3,3,1]
 
 Follow up:
 Could you optimize your algorithm to use only O(k) extra space?
 */

func getRow(_ rowIndex: Int) -> [Int] {
    guard rowIndex >= 0 else { return [] }
    var ret = [Int]()
    var aux = 1
    var index = 1
    while index <= rowIndex / 2 + 1 {
        ret.append(aux)
        aux = aux * (rowIndex + 1 - index) / index
        index += 1
    }
    while index <= rowIndex + 1 {
        ret.append(ret[rowIndex + 1 - index])
        index += 1
    }
    return ret
}

getRow(0)
getRow(3)
getRow(4)
getRow(5)
getRow(6)
