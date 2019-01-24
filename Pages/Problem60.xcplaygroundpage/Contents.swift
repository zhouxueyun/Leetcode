
import Foundation

/**
 Permutation Sequence
 
 The set [1,2,3,...,n] contains a total of n! unique permutations.
 
 By listing and labeling all of the permutations in order, we get the following sequence for n = 3:
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 Given n and k, return the kth permutation sequence.
 
 Note:
 Given n will be between 1 and 9 inclusive.
 Given k will be between 1 and n! inclusive.

 Example 1:
 Input: n = 3, k = 3
 Output: "213"
 
 Example 2:
 Input: n = 4, k = 9
 Output: "2314"
 */

class Solution {
    static let factorials = [1, 1, 2, 6, 24, 120, 720, 5040, 40320]
    static let numbers = [1,2,3,4,5,6,7,8,9]
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var ret = ""
        var nums = Solution.numbers
        var k = k - 1
        for i in (1...n).reversed() {
            let index = k / Solution.factorials[i-1]
            ret.append(String(nums[index]))
            nums.remove(at: index)
            k = k % Solution.factorials[i-1]
        }
        return ret
    }
}

let solution = Solution()
solution.getPermutation(3, 3)
solution.getPermutation(4, 9)
