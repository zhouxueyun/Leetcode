
import Foundation

/**
 Combination Sum III
 
 Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.
 
 Note:
 All numbers will be positive integers.
 The solution set must not contain duplicate combinations.
 
 Example 1:
 Input: k = 3, n = 7
 Output: [[1,2,4]]
 
 Example 2:
 Input: k = 3, n = 9
 Output: [[1,2,6], [1,3,5], [2,3,4]]
 */

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var cur = [Int]()
        var rst = [[Int]]()
        dfs(k, n, 1, &cur, &rst)
        print(rst)
        return rst
    }
    
    func dfs(_ k: Int, _ n: Int, _ start: Int, _ cur: inout [Int], _ rst: inout [[Int]]) {
        if k == 0 {
            if n == 0 { rst.append(cur) }
        } else {
            for i in start..<10 {
                if n - i < 0 { break }
                cur.append(i)
                dfs(k-1, n-i, i+1, &cur, &rst)
                cur.popLast()
            }
        }
    }
}

let s = Solution()
s.combinationSum3(3, 7)
s.combinationSum3(3, 9)
s.combinationSum3(1, 9)
s.combinationSum3(2, 17)
s.combinationSum3(3, 24)
s.combinationSum3(4, 30)
