
import Foundation

/**
 Find Minimum in Rotated Sorted Array
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 You may assume no duplicate exists in the array.
 
 Example 1:
 Input: [3,4,5,1,2]
 Output: 1
 
 Example 2:
 Input: [4,5,6,7,0,1,2]
 Output: 0
 */

/**
 Find Minimum in Rotated Sorted Array II
 
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 The array may contain duplicates.
 
 Example 1:
 Input: [1,3,5]
 Output: 1
 
 Example 2:
 Input: [2,2,2,0,1]
 Output: 0
 */

func findMin(_ nums: [Int]) -> Int {
    var start = 0
    var end = nums.count - 1
    while start < end {
        if nums[start] < nums[end] {
            break
        }
        let mid = start + (end - start) / 2
        if nums[mid] > nums[end] {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return nums[start]
}

func findMin1(_ nums: [Int]) -> Int {
    var pivot = -1
    for i in 1 ..< nums.count {
        if nums[i] < nums[i-1] {
            pivot = i
            break
        }
    }
    if pivot < 0 {
        pivot = 0
    }
    return nums[pivot]
}

func findMin2(_ nums: [Int]) -> Int {
    var start = 0
    var end = nums.count - 1
    while start < end && nums[start] >= nums[end] {
        let mid = start + (end - start) / 2
        if nums[mid] > nums[end] {
            start = mid + 1
        } else if nums[mid] < nums[start] {
            end = mid
        } else {
            start += 1
        }
    }
    return nums[start]
}

findMin([3,4,5,1,2])
findMin([4,5,6,7,0,1,2])

findMin2([1,3,5])
findMin2([2,2,2,0,1])
