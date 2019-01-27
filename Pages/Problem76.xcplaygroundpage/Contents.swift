
import Foundation

/**
 Minimum Window Substring
 
 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).
 
 Example:
 Input: S = "ADOBECODEBANC", T = "ABC"
 Output: "BANC"
 
 Note:
 If there is no such window in S that covers all characters in T, return the empty string "".
 If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
 */

func minWindow(_ s: String, _ t: String) -> String {
    let sArr = Array(s.utf16).map { Int($0) }
    let tArr = Array(t.utf16).map { Int($0) }
    var dict = Array(repeating: 0, count: 128)
    
    for char in tArr {
        dict[char] += 1
    }
    
    var window = Int.max
    var count = t.count
    var left = 0
    var begin = 0
    
    for right in 0 ..< sArr.count {
        if dict[sArr[right]] > 0 {
            count -= 1
        }
        dict[sArr[right]] -= 1
        
        while count == 0 {
            if right - left < window {
                window = right - left
                begin = left
            }
            
            if dict[sArr[left]] == 0 {
                count += 1
            }
            dict[sArr[left]] += 1
            left += 1
        }
    }
    
    if window == Int.max {
        return ""
    }
    
    let leftIndex = s.index(s.startIndex, offsetBy: begin)
    let rightIndex = s.index(leftIndex, offsetBy: window)
    
    return String(s[leftIndex...rightIndex])
}

minWindow("ADOBECODEBANC", "ABC")
minWindow("aaaaaaaaaaaabbbbbcdd", "abcdd")
minWindow("cabwefgewcwaefgcf", "cae")
