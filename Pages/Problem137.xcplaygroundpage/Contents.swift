import Foundation

/**
 Single Number II
 
 Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 Input: [2,2,3,2]
 Output: 3
 
 Example 2:
 Input: [0,1,0,1,0,1,99]
 Output: 99
 */

func singleNumber(_ nums: [Int]) -> Int {
    var a = 0
    var b = 0
    for c in nums {
        b = b ^ c & ~a
        a = a ^ c & ~b
    }
    return b
}

singleNumber([1, 1, 1, 2])
singleNumber([1, 1, 1, 2, 2, 2, 99])
