
import Foundation

/**
 Longest Substring Without Repeating Characters
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Example 2:
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Example 3:
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */


func lengthOfLongestSubstring(_ s: String) -> Int {
    let chars = Array(s)
    var repeated = [Bool](repeating: false, count: 256)
    var slow = 0
    var ret = 0
    for fast in 0..<chars.count {
        let ch = Int(UInt8.init(ascii: Unicode.Scalar(String(chars[fast]))!))
        while repeated[ch] && slow < fast {
            let ch1 = Int(UInt8.init(ascii: Unicode.Scalar(String(chars[slow]))!))
            repeated[ch1] = false
            slow += 1
        }
        repeated[ch] = true
        ret = max(ret, fast - slow + 1)
    }
    return ret
}

lengthOfLongestSubstring("abcabcbb")
lengthOfLongestSubstring("bbbbb")
lengthOfLongestSubstring("pwwkew")
