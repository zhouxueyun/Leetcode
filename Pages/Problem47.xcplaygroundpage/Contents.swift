//: [Previous](@previous)

import Foundation

/**
 Permutations II
 
 Given a collection of numbers that might contain duplicates, return all possible unique permutations.
 
 Example:
 Input: [1,1,2]
 Output:
 [
    [1,1,2],
    [1,2,1],
    [2,1,1]
 ]
 */

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var ret = [[Int]]()
    var nums = nums
    helper(&nums, 0, &ret)
    return ret
}

func helper(_ nums: inout [Int], _ pos: Int, _ ret: inout [[Int]]) {
    if pos == nums.count - 1 {
        ret.append(Array(nums))
        return
    }
    for i in pos..<nums.count {
        if Array(nums[pos..<i]).first(where: { $0 == nums[i] }) == nil {
            nums.swapAt(pos, i)
            helper(&nums, pos + 1, &ret)
            nums.swapAt(pos, i)
        }
    }
}

permuteUnique([1,1,2])
permuteUnique([2,2,1,1])
