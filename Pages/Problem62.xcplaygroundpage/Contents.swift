
import Foundation

/**
 Unique Paths
 
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 How many possible unique paths are there?
 
 Above is a 7 x 3 grid. How many possible unique paths are there?
 
 Note: m and n will be at most 100.
 
 Example 1:
 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 
 Example 2:
 Input: m = 7, n = 3
 Output: 28
 */

func uniquePaths(_ m: Int, _ n: Int) -> Int {
//    var ret = 0
//    helper(m, n, 1, 1, &ret)
//    return ret
    
    var dp = (0..<m).map { _ in (0..<n).map({ _ in 0 }) }
    for i in 0..<m {
        for j in 0..<n {
            if i == 0 || j == 0 { dp[i][j] = 1 }
            else { dp[i][j] = dp[i-1][j] + dp[i][j-1] }
        }
    }
    return dp.last?.last ?? 1
}

func helper(_ m: Int, _ n: Int, _ i: Int, _ j: Int, _ ret: inout Int) {
    if i == m && j == n {
        ret += 1
        return
    }
    // right
    if i + 1 <= m {
        helper(m, n, i+1, j, &ret)
    }
    // down
    if j + 1 <= m {
        helper(m, n, i, j+1, &ret)
    }
}

print(uniquePaths(3, 2))
print(uniquePaths(7, 3))
