
import Foundation

/**
 Word Break II
 
 Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, add spaces in s to construct a sentence where each word is a valid dictionary word. Return all such possible sentences.
 
 Note:
 The same word in the dictionary may be reused multiple times in the segmentation.
 You may assume the dictionary does not contain duplicate words.
 
 Example 1:
 Input:
 s = "catsanddog"
 wordDict = ["cat", "cats", "and", "sand", "dog"]
 Output:
 [
    "cats and dog",
    "cat sand dog"
 ]

 Example 2:
 Input:
 s = "pineapplepenapple"
 wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
 Output:
 [
    "pine apple pen apple",
    "pineapple pen apple",
    "pine applepen apple"
 ]
 Explanation: Note that you are allowed to reuse a dictionary word.
 
 Example 3:
 Input:
 s = "catsandog"
 wordDict = ["cats", "dog", "sand", "and", "cat"]
 Output:
 []
 */

func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    var map = [String: [String]]()
    let ret = dfs(s, wordDict, &map)
    print(map)
    return ret
}

func dfs(_ s: String, _ wordDict: [String], _ map: inout [String: [String]]) -> [String] {
    if let arr = map[s] {
        return arr
    }
    var ret = [String]()
    if s.count == 0 {
        ret.append("")
        return ret
    }
    
    for word in wordDict {
        if s.starts(with: word) {
            let next = String(s[s.index(s.startIndex, offsetBy: word.count) ..< s.endIndex])
            let arr = dfs(next, wordDict, &map)
            print(word, arr)
            for sub in arr {
                ret.append(word + (sub.isEmpty ? "" : " ") + sub)
            }
        }
    }
    map[s] = ret
    return ret
}
    

wordBreak("leetcode", ["leet", "code"])
wordBreak("pineapplepenapple", ["apple", "pen", "applepen", "pine", "pineapple"])
wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"])
wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
