
import Foundation

/**
 Interleaving String
 
 Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.
 
 Example 1:
 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbcbcac"
 Output: true
 
 Example 2:
 Input: s1 = "aabcc", s2 = "dbbca", s3 = "aadbbbaccc"
 Output: false
 */

func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    if s1.count + s2.count != s3.count { return false }
    let arr1 = Array(s1)
    let arr2 = Array(s2)
    let arr3 = Array(s3)
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: s2.count + 1), count: s1.count + 1)
    for i in 0...s1.count {
        for j in 0...s2.count {
            if i == 0 && j == 0 {
                dp[i][j] = true
            }
            else if i == 0 {
                dp[i][j] = dp[i][j-1] && arr2[j-1] == arr3[i+j-1]
            }
            else if j == 0 {
                dp[i][j] = dp[i-1][j] && arr1[i-1] == arr3[i+j-1]
            }
            else {
                dp[i][j] = (dp[i-1][j] && arr1[i-1] == arr3[i+j-1]) || (dp[i][j-1] && arr2[j-1] == arr3[i+j-1])
            }
        }
    }
    return dp[s1.count][s2.count]
}

isInterleave("aabcc", "dbbca", "aadbbcbcac")
isInterleave("aabcc", "dbbca", "aadbbbaccc")
isInterleave("bbbbbabbbbabaababaaaabbababbaaabbabbaaabaaaaababbbababbbbbabbbbababbabaabababbbaabababababbbaaababaa",
    "babaaaabbababbbabbbbaabaabbaabbbbaabaaabaababaaaabaaabbaaabaaaabaabaabbbbbbbbbbbabaaabbababbabbabaab",
    "babbbabbbaaabbababbbbababaabbabaabaaabbbbabbbaaabbbaaaaabbbbaabbaaabababbaaaaaabababbababaababbababbbababbbbaaaabaabbabbaaaaabbabbaaaabbbaabaaabaababaababbaaabbbbbabbbbaabbabaabbbbabaaabbababbabbabbab")
