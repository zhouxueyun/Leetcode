
import Foundation

/**
 Implement strStr()
 
 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 Example 1:
 Input: haystack = "hello", needle = "ll"
 Output: 2
 
 Example 2:
 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 
 Clarification:
 What should we return when needle is an empty string? This is a great question to ask during an interview.
 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty { return 0 }
    if haystack.count < needle.count { return -1 }
    let hArr = Array(haystack)
    for i in 0..<haystack.count-needle.count+1 {
        if String(hArr[i..<i+needle.count]) == needle {
            return i
        }
    }
    return -1
}

strStr("hello", "ll")
strStr("aaaaa", "bba")
