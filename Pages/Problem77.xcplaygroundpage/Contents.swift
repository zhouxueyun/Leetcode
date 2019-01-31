
import Foundation

/**
 Combinations
 
 iven two integers n and k, return all possible combinations of k numbers out of 1 ... n.
 
 Example:
 
 Input: n = 4, k = 2
 Output:
 [
    [2,4],
    [3,4],
    [2,3],
    [1,2],
    [1,3],
    [1,4],
 ]
 */

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var ret = [[Int]]()
    var curr = [Int]()
    helper(n, k, 0, &curr, &ret)
    return ret
}

func helper(_ n: Int, _ k: Int, _ pos: Int, _ curr: inout [Int], _ ret: inout [[Int]]) {
    if k == 0 {
        ret.append(Array(curr))
    } else if pos <= n-k {
        for i in pos+1...n-k+1 {
            curr.append(i)
            helper(n, k-1, i, &curr, &ret)
            curr.removeLast()
        }
    }
}

combine(4, 2)
