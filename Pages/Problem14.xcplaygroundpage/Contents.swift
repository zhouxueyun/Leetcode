
import Foundation

/**
 Longest Common Prefix
 
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "".
 
 Example 1:
 Input: ["flower","flow","flight"]
 Output: "fl"
 
 Example 2:
 Input: ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
 
 Note:
 All given inputs are in lowercase letters a-z.
 */

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return "" }
    var ret = strs[0]
    for i in 1..<strs.count {
        let charRet = Array(ret)
        let charStr = Array(strs[i])
        var len = 0
        while len < charRet.count && len < charStr.count && charRet[len] == charStr[len] {
            len += 1
        }
        if len == 0 { return "" }
        ret = String(charRet[0..<len])
    }
    return ret
}

longestCommonPrefix(["flower","flow","flight"])
longestCommonPrefix(["dog","racecar","car"])
