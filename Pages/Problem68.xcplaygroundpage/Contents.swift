
import Foundation

/**
 Sqrt(x)
 
 Implement int sqrt(int x).
 
 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
 
 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
 
 Example 1:
 Input: 4
 Output: 2
 
 Example 2:
 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
 the decimal part is truncated, 2 is returned.
 */

func mySqrt(_ x: Int) -> Int {
    guard x > 1 else {
        return x
    }
    var start = 1, end = x / 2
    while start < end {
        let mid = start + (end - start) / 2
        if x / mid < mid {
            end = mid - 1
        } else if x / mid > mid {
            start = mid + 1
        } else {
            return mid
        }
    }
    return x/end < end ? end-1 : end
}

mySqrt(5)
mySqrt(4)
mySqrt(8)
mySqrt(32)
mySqrt(100)
