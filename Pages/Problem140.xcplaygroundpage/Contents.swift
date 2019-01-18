
import Foundation

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
