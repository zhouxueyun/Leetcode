
import Foundation

/**
 Multiply Strings
 
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
 
 Example 1:
 Input: num1 = "2", num2 = "3"
 Output: "6"
 
 Example 2:
 Input: num1 = "123", num2 = "456"
 Output: "56088"
 
 Note:
 The length of both num1 and num2 is < 110.
 Both num1 and num2 contain only digits 0-9.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 */

func multiply(_ num1: String, _ num2: String) -> String {
    if num1.isEmpty || num1 == "0" || num2.isEmpty || num2 == "0" { return "0" }
    var nums1 = num1.reversed().map { Int(String($0))! }
    var nums2 = num2.reversed().map { Int(String($0))! }
    var ret = [Int](repeating: 0, count: nums1.count + nums2.count)
    for i in 0..<nums1.count {
        for j in 0..<nums2.count {
            ret[i+j] += nums1[i] * nums2[j]
        }
    }
    var c = 0
    for i in 0..<ret.count {
        let n = ret[i] + c
        ret[i] = n % 10
        c = n / 10
    }
    if ret.last! == 0 { ret.removeLast() }
    return ret.reversed().reduce("") { $0+String($1) }
}

multiply("2", "3")
multiply("123", "456")

