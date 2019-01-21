
import Foundation

/**
 Reverse Integer
 
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 Input: 123
 Output: 321
 
 Example 2:
 Input: -123
 Output: -321
 
 Example 3:
 Input: 120
 Output: 21
 
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */

func reverse(_ x: Int) -> Int {
    var ret = 0
    var x = x
    while x != 0 {
        ret = ret * 10 + x % 10
        if ret > Int(Int32.max) || ret < Int(Int32.min) { return 0 }
        x /= 10
    }
    return ret
}

reverse(123)
reverse(-123)
reverse(120)
reverse(1534236469)

