
import Foundation

/**
 House Robber II
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 
 Example 1:
 Input: [2,3,2]
 Output: 3
 Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2),
 because they are adjacent houses.
 
 Example 2:
 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 */

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count < 4 { return nums.max() ?? 0 }
        var pre = nums[0]
        var cur = max(nums[0], nums[1])
        for num in nums[2..<nums.count-1] {
            (pre, cur) = (cur, max(pre + num, cur))
        }
        var max_ = cur
        
        pre = nums[1]
        cur = max(nums[1], nums[2])
        for num in nums[3..<nums.count] {
            (pre, cur) = (cur, max(pre + num, cur))
        }
        return max(max_, cur)
    }
}

let s = Solution()
s.rob([2,3,2])
s.rob([1,2,3,1])
