
import Foundation

/**
 First Missing Positive
 
 Given an unsorted integer array, find the smallest missing positive integer.
 
 Example 1:
 Input: [1,2,0]
 Output: 3
 
 Example 2:
 Input: [3,4,-1,1]
 Output: 2
 
 Example 3:
 Input: [7,8,9,11,12]
 Output: 1
 
 Note:
 Your algorithm should run in O(n) time and uses constant extra space.
 */

func firstMissingPositive(_ nums: [Int]) -> Int {
    var i = 0
    var nums = nums
    while i < nums.count {
        if nums[i] != i+1 && nums[i] <= nums.count && nums[i] >= 1 && nums[nums[i]-1] != nums[i] {
            nums.swapAt(i, nums[i]-1) // 放到应该放置的位置
        } else {
            i += 1
        }
    }
    i = 0
    while i < nums.count {
        if nums[i] != i+1 { return i+1 }
        i += 1
    }
    return nums.count + 1
}

firstMissingPositive([1,2,0])
firstMissingPositive([3,4,-1,1])
firstMissingPositive([7,8,9,11,12])
