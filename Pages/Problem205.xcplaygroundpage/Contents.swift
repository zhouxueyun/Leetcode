
import Foundation

/**
 Isomorphic Strings
 
 Given two strings s and t, determine if they are isomorphic.
 
 Two strings are isomorphic if the characters in s can be replaced to get t.
 
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
 
 Example 1:
 Input: s = "egg", t = "add"
 Output: true
 
 Example 2:
 Input: s = "foo", t = "bar"
 Output: false
 
 Example 3:
 Input: s = "paper", t = "title"
 Output: true
 
 Note:
 You may assume both s and t have the same length.
 */

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let n = s.count
        let sArr = Array(s)
        let tArr = Array(t)
        var ms = [Character: Int]()
        var mt = [Character: Int]()
        for i in 0..<n {
            let sc = ms[sArr[i]] ?? 0
            let tc = mt[tArr[i]] ?? 0
            if sc != tc { return false }
            ms[sArr[i]] = i + 1
            mt[tArr[i]] = i + 1
        }
        return true
    }
}

let s = Solution()
s.isIsomorphic("egg", "add")
s.isIsomorphic("foo", "bar")
s.isIsomorphic("paper", "title")
s.isIsomorphic("aba", "baa")
