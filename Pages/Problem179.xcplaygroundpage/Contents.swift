
import Foundation

/**
 Largest Number
 
 Given a list of non negative integers, arrange them such that they form the largest number.
 
 Example 1:
 Input: [10,2]
 Output: "210"
 
 Example 2:
 Input: [3,30,34,5,9]
 Output: "9534330"
 Note: The result may be very large, so you need to return a string instead of an integer.
 */

func largestNumber(_ nums: [Int]) -> String {
    let sorted = nums.sorted { (a, b) -> Bool in
        let str1 = String(a) + String(b)
        let str2 = String(b) + String(a)
        return str1 > str2
    }
    if sorted[0] == 0 { return "0" }
    return sorted.reduce("") { "\($0)\($1)" }
}

largestNumber([0,0])
largestNumber([10,2])
largestNumber([3,30,34,5,9])
