
import Foundation

/**
 Permutations
 
 Given a collection of distinct integers, return all possible permutations.
 
 Example:
 
 Input: [1,2,3]
 Output:
 [
    [1,2,3],
    [1,3,2],
    [2,1,3],
    [2,3,1],
    [3,1,2],
    [3,2,1]
 ]
 */

func permute(_ nums: [Int]) -> [[Int]] {
    var ret = [[Int]]()
    var nums = nums
    helper(&nums, 0, &ret)
    return ret
}

func helper(_ nums: inout [Int], _ pos: Int, _ ret: inout [[Int]]) {
    print(pos)
    if pos == nums.count - 1 {
        ret.append(Array(nums))
        return
    }
    for i in pos..<nums.count {
        nums.swapAt(pos, i)
        helper(&nums, pos + 1, &ret)
        nums.swapAt(pos, i)
    }
}

permute([1, 2, 3])
