
import Foundation

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

