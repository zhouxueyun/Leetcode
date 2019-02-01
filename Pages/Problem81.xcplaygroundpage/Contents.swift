
import Foundation

/**
 Search in Rotated Sorted Array II
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).
 
 You are given a target value to search. If found in the array return true, otherwise return false.
 
 Example 1:
 Input: nums = [2,5,6,0,0,1,2], target = 0
 Output: true
 
 Example 2:
 Input: nums = [2,5,6,0,0,1,2], target = 3
 Output: false
 
 Follow up:
 This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
 Would this affect the run-time complexity? How and why?
 */

func search(_ nums: [Int], _ target: Int) -> Bool {
    if nums.isEmpty { return false }
    var left = 0
    var right = nums.count-1
    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] == target { return true }
        if nums[mid] > nums[left] || nums[mid] > nums[right] {
            if nums[left] <= target && target < nums[mid] { right = mid - 1 }
            else { left = mid }
        } else if nums[mid] < nums[left] || nums[mid] < nums[right] {
            if nums[mid] < target && target <= nums[right] { left = mid + 1 }
            else { right = mid }
        } else {
            right -= 1
        }
    }
    return nums[left] == target || nums[right] == target
}


search([2,5,6,0,0,1,2], 0)
search([2,5,6,0,0,1,2], 3)

search([1,2,3,4,5,6], 1)
search([1,2,3,4,5,6], 6)
