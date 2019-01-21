
import Foundation

/**
 Majority Element
 
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
 You may assume that the array is non-empty and the majority element always exist in the array.
 
 Example 1:
 Input: [3,2,3]
 Output: 3
 
 Example 2:
 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

func majorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var majority = 0
    for num in nums {
        if num == majority {
            count += 1
        } else {
            if count == 0 {
                majority = num
                count += 1
            } else {
                count -= 1
            }
        }
    }
    return majority
}

majorityElement([3,2,3])
majorityElement([2,2,1,1,1,2,2])
