
import Foundation

/**
 Edit Distance
 
 Given two words word1 and word2, find the minimum number of operations required to convert word1 to word2.
 
 You have the following 3 operations permitted on a word:
 
 Insert a character
 Delete a character
 Replace a character
 
 Example 1:
 Input: word1 = "horse", word2 = "ros"
 Output: 3
 Explanation:
 horse -> rorse (replace 'h' with 'r')
 rorse -> rose (remove 'r')
 rose -> ros (remove 'e')
 
 Example 2:
 Input: word1 = "intention", word2 = "execution"
 Output: 5
 Explanation:
 intention -> inention (remove 't')
 inention -> enention (replace 'i' with 'e')
 enention -> exention (replace 'n' with 'x')
 exention -> exection (replace 'n' with 'c')
 exection -> execution (insert 'u')
 */

func minDistance(_ word1: String, _ word2: String) -> Int {
    let aChars = Array(word1)
    let bChars = Array(word2)
    let aLen = aChars.count
    let bLen = bChars.count
    var dp = Array(repeating: Array(repeating: 0, count: bLen + 1), count: aLen + 1)
    for i in 0...aLen {
        for j in 0...bLen {
            if i == 0 { dp[i][j] = j }
            else if j == 0 { dp[i][j] = i }
            else if aChars[i-1] == bChars[j-1] { dp[i][j] = dp[i-1][j-1] }
            else { dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1 }
        }
    }
    return dp[aLen][bLen]
}

minDistance("horse", "ros") // 3
minDistance("intention", "execution") // 5
