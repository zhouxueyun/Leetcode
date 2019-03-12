
import Foundation

/**
 Count Primes
 
 Count the number of prime numbers less than a non-negative number, n.
 
 Example:
 
 Input: 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 */

class Solution {
    func countPrimes(_ n: Int) -> Int {
        var isPrimes = [Bool](repeating: true, count: n)
        var cnt = 0
        var i = 2
        while i < n {
            if isPrimes[i] {
                print(i)
                cnt += 1
                var j = i
                while j < n {
                    isPrimes[j] = false
                    j += i
                }
            }
            i += 1
        }
        return cnt
    }
}

let s = Solution()
s.countPrimes(10)
s.countPrimes(100)
