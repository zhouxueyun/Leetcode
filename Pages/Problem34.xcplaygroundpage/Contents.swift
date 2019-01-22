
import Foundation

/**
 Find First and Last Position of Element in Sorted Array
 
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 
 Your algorithm's runtime complexity must be in the order of O(log n).
 
 If the target is not found in the array, return [-1, -1].
 
 Example 1:
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 Example 2:
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 */

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    return [findLeftIndex(nums, target),
            findRightIndex(nums, target)]
}

func findLeftIndex(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    var ret = -1
    while start <= end {
        let mid = start + (end - start) / 2
        if target < nums[mid] {
            end = mid - 1
        } else if target > nums[mid] {
            start = mid + 1
        } else {
            ret = mid
            end = mid - 1
        }
    }
    return ret
}

func findRightIndex(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    var ret = -1
    while start <= end {
        let mid = start + (end - start) / 2
        if target < nums[mid] {
            end = mid - 1
        } else if target > nums[mid] {
            start = mid + 1
        } else {
            ret = mid
            start = mid + 1
        }
    }
    return ret
}

searchRange([5,7,7,8,8,10], 8)
searchRange([5,7,7,8,8,10], 7)
searchRange([5,7,7,8,8,10], 6)


