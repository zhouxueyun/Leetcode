
import Foundation

/**
 Maximal Square
 
 Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
 
 Example:
 
 Input:
 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 
 Output: 4
 */

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.isEmpty || matrix[0].isEmpty { return 0 }
        var max_val = 0
        
        let row = matrix.count
        let col = matrix[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: col), count: row)
        
        for i in 0..<row {
            for j in 0..<col {
                if i == 0 || j == 0 {
                    dp[i][j] = matrix[i][j] == "1" ? 1 : 0
                } else if matrix[i][j] == "1" {
                    dp[i][j] = 1 + min(min(dp[i][j-1], dp[i-1][j]), dp[i-1][j-1])
                }
                max_val = max(max_val, dp[i][j])
            }
        }
        print(dp)
        return max_val * max_val
    }
}

let s = Solution()
s.maximalSquare([
    ["1", "0", "1", "0", "0"],
    ["1", "0", "1", "1", "1"],
    ["1", "1", "1", "1", "1"],
    ["1", "0", "0", "1", "0"],
    ])
