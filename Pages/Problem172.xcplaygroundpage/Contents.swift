
import Foundation

/**
 Factorial Trailing Zeroes
 
 Given an integer n, return the number of trailing zeroes in n!.
 
 Example 1:
 Input: 3
 Output: 0
 Explanation: 3! = 6, no trailing zero.
 
 Example 2:
 Input: 5
 Output: 1
 Explanation: 5! = 120, one trailing zero.
 */

func trailingZeroes(_ n: Int) -> Int {
    var ret = 0
    var num = n
    while num != 0 {
        num /= 5
        ret += num
    }
    return ret
}

trailingZeroes(10)
trailingZeroes(30)
trailingZeroes(100)
