
import Foundation

/**
 Minimum Size Subarray Sum
 
 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
 
 Example:
 Input: s = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: the subarray [4,3] has the minimal length under the problem constraint.
 
 Follow up:
 If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
 */

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var rst = Int.max, sum = 0, left = 0
        for i in 0..<nums.count {
            sum += nums[i]
            while sum >= s {
                rst = min(i - left + 1, rst)
                sum -= nums[left]
                left += 1
            }
        }
        return rst == Int.max ? 0 : rst
    }
}

let s = Solution()
s.minSubArrayLen(7, [2,3,1,2,4,3])
