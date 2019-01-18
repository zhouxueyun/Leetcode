import Foundation

/**
 Single Number
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 Input: [2,2,1]
 Output: 1
 
 Example 2:
 Input: [4,1,2,1,2]
 Output: 4
 */

func singleNumber(_ nums: [Int]) -> Int {
    var ret = 0
    for i in nums {
        ret ^= i
    }
    return ret
}

singleNumber([1, 1, 2])
singleNumber([1, 1, 2, 2, 4])
