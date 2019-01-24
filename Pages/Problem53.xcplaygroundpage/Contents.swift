
import Foundation

/**
 Maximum Subarray
 
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 
 Example:
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 
 Follow up:
 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

func maxSubArray(_ nums: [Int]) -> Int {
    var ret = Int(Int32.min)
    var cur = 0
    for i in 0..<nums.count {
        cur += nums[i]
        if cur > ret { ret = cur }
        if cur < 0 { cur = 0 }
    }
    return ret
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
