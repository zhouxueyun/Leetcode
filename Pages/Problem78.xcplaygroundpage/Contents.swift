
import Foundation

/**
 Subsets
 
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: nums = [1,2,3]
 Output:
 [
    [3],
    [1],
    [2],
    [1,2,3],
    [1,3],
    [2,3],
    [1,2],
    []
 ]
 */

func subsets(_ nums: [Int]) -> [[Int]] {
    var ret = [[Int]]()
    helper(nums, 0, [], &ret)
    return ret
}

func helper(_ nums: [Int], _ pos: Int, _ pre: [Int], _ ret: inout [[Int]]) {
    ret.append(pre)
    if pos >= nums.count { return }
    for i in pos..<nums.count {
        helper(nums, i + 1, pre + [nums[i]], &ret)
    }
}


subsets([1,2,3])
