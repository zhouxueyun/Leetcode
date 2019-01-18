
import Foundation

/**
 Word Break
 
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
 
 Note:
 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 
 Example 1:
 Input: s = "leetcode", wordDict = ["leet", "code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".

 Example 2:
 Input: s = "applepenapple", wordDict = ["apple", "pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.

 Example 3:
 Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output: false
 */

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var maxLen = 0
    var minLen = s.count
    for word in wordDict {
        maxLen = max(word.count, maxLen)
        minLen = min(word.count, minLen)
    }

    let dict = Set(wordDict)
    let arr = Array(s)
    var dp = [Bool](repeating: false, count: s.count + 1)
    dp[0] = true
    
    for i in 1 ... s.count {
        if !dp[i-1] { continue }
        for j in i ... s.count {
            if dp[j] || j - i + 1 < minLen{ continue }
            if j - i + 1 > maxLen { break }
            if dict.contains(String(arr[i-1 ... j-1])) {
                dp[j] = true
            }
        }
        if dp[s.count] { return true }
    }
    
    return dp[s.count]
}

wordBreak("leetcode", ["leet", "code"])
wordBreak("applepenapple", ["apple", "pen"])
wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])

