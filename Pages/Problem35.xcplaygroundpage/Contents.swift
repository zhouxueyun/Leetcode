
import Foundation

/**
 Search Insert Position
 
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 Example 1:
 Input: [1,3,5,6], 5
 Output: 2
 
 Example 2:
 Input: [1,3,5,6], 2
 Output: 1
 
 Example 3:
 Input: [1,3,5,6], 7
 Output: 4
 
 Example 4:
 Input: [1,3,5,6], 0
 Output: 0
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var start = 0
    var end = nums.count - 1
    while start <= end {
        print(start, end)
        if target <= nums[start] { return start }
        if target > nums[end] { return end + 1 }
        let mid = start + (end - start) / 2
        if target > nums[mid] {
            start = mid + 1
        } else if target < nums[mid] {
            end = mid - 1
        } else {
            return mid
        }
    }
    return start
}

func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
    for (index, num) in nums.enumerated() {
        if num >= target { return index }
    }
    return nums.count
}

searchInsert([1,3], 2)
searchInsert([1,3,5,6], 5)
searchInsert([1,3,5,6], 2)
searchInsert([1,3,5,6], 7)
searchInsert([1,3,5,6], 0)

