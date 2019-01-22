
import Foundation

/**
 Divide Two Integers
 
 Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
 
 Return the quotient after dividing dividend by divisor.
 
 The integer division should truncate toward zero.
 
 Example 1:
 Input: dividend = 10, divisor = 3
 Output: 3
 
 Example 2:
 Input: dividend = 7, divisor = -3
 Output: -2
 
 Note:
 Both dividend and divisor will be 32-bit signed integers.
 The divisor will never be 0.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 2^31 − 1 when the division result overflows.
 */

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    guard divisor != 0 else { return Int(Int32.max)}
    
    //protect against overflow
    if dividend == Int32.min {
        if divisor == -1 { return Int(Int32.max)}
        else if divisor == 1 { return Int(Int32.min) }
    }
    
    var sign = 1
    var dividend = CLong(dividend)
    var divisor = CLong(divisor)
    
    if dividend < 0 {
        dividend = -dividend
        sign = -sign
    }
    if divisor < 0 {
        divisor = -divisor
        sign = -sign
    }
    var result = 0
    while dividend >= divisor {
        var shift = 0
        while dividend >= (divisor << shift) {
            shift += 1
        }
        result += 1 << (shift - 1)
        dividend -= divisor << (shift-1)
    }
    return sign * result
}

divide(10, 3)
divide(7, -3)

