
import Foundation

/**
 Search in Rotated Sorted Array
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).
 
 You are given a target value to search. If found in the array return its index, otherwise return -1.
 
 You may assume no duplicate exists in the array.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 Example 1:
 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 
 Example 2:
 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    while start <= end {
        let mid = start + (end - start) / 2
        if nums[mid] == target { return mid }
        if nums[mid] < nums[end] { // 后半截
            if nums[mid] < target && target <= nums[end] { start = mid + 1 }
            else { end = mid - 1 }
        } else { // 前半截
            if nums[start] <= target  && target < nums[mid] { end = mid - 1 }
            else { start = mid + 1 }
        }
    }
    return -1
}

print(search([4,5,6,7,0,1,2], 0))
print(search([4,5,6,7,0,1,2], 3))
print(search([1, 3], 3))
