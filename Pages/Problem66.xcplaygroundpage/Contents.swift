
import Foundation

/**
 Plus One
 
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 Example 1:
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 
 Example 2:
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 */

func plusOne(_ digits: [Int]) -> [Int] {
    var carry = 1
    var ret = digits
    for i in (0..<ret.count).reversed() {
        let sum = ret[i] + carry
        ret[i] = sum % 10
        carry = sum / 10
        if carry == 0 { break }
    }
    if carry > 0 {
        ret.insert(carry, at: 0)
    }
    return ret
}

plusOne([1,2,3])
plusOne([4,3,2,1])
plusOne([9,9,9,9])
