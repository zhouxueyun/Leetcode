
import Foundation

/**
 Unique Binary Search Trees
 
 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?
 
 Example:
 
 Input: 3
 Output: 5
 Explanation:
 Given n = 3, there are a total of 5 unique BST's:
 
 1         3     3      2      1
  \       /     /      / \      \
   3     2     1      1   3      2
  /     /       \                 \
 2     1         2                 3
 */

func numTrees(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: n+1)
    dp[0] = 1
    for i in 1...n {
        for j in 0..<i {
            dp[i] += dp[j] * dp[i-j-1]
        }
    }
    return dp[n]
}

numTrees(2)
numTrees(3)
numTrees(4)
numTrees(5)
numTrees(6)
