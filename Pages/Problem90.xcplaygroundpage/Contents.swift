
import Foundation

/**
 Subsets II
 
 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: [1,2,2]
 Output:
 [
    [2],
    [1],
    [1,2,2],
    [2,2],
    [1,2],
    []
 ]
 */

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var ret = [[Int]]()
    helper(nums.sorted(), 0, [], &ret)
    return ret
}

func helper(_ nums: [Int], _ pos: Int, _ pre: [Int], _ ret: inout [[Int]]) {
    ret.append(pre)
    var i = pos
    while i < nums.count {
        helper(nums, i + 1, pre + [nums[i]], &ret)
        while i < nums.count - 1 && nums[i] == nums[i+1] {
            i += 1
        }
        i += 1
    }
}

subsetsWithDup([1, 2, 2])
subsetsWithDup([4,4,4,1,4])
