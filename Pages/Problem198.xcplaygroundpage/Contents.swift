
import Foundation

/**
 House Robber
 
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.
 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 
 Example 1:
 Input: [1,2,3,1]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
 Total amount you can rob = 1 + 3 = 4.
 
 Example 2:
 Input: [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
 Total amount you can rob = 2 + 9 + 1 = 12.
 */

// 临时变量 
func rob(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var prev1 = 0
    var prev2 = 0
    for i in 0..<nums.count {
        let new = max(prev2 + nums[i], prev1)
        prev2 = prev1
        prev1 = new
    }
    return max(prev1, prev2)
}

// dp 数组
func rob1(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    if nums.count <= 1 { return nums[0] }
    var dp = [Int](repeating: 0, count: nums.count)
    dp[0] = nums[0]
    dp[1] = max(nums[0], nums[1])
    for i in 2..<nums.count {
        let num = nums[i]
        dp[i] = max(dp[i-2] + num, dp[i-1])
    }
    return dp.last!
}

rob([2,1,1,2])
rob([1,2,3,1])
rob([2,7,9,3,1])
rob([2,7,1,1,9,3,1])
