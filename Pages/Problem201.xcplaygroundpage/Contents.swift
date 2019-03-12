
import Foundation

/**
 Bitwise AND of Numbers Range
 
 Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.
 
 Example 1:
 
 Input: [5,7]
 Output: 4
 Example 2:
 
 Input: [0,1]
 Output: 0
 */

class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m == n { return n }
        if n - m == 1 { return m & n }
        return rangeBitwiseAnd(m >> 1, n >> 1) << 1
    }
}

let s = Solution()
s.rangeBitwiseAnd(0, 1)
s.rangeBitwiseAnd(5, 7)
s.rangeBitwiseAnd(4, 7)

