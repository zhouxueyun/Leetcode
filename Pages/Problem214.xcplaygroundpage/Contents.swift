
import Foundation

/**
 Shortest Palindrome
 
 Given a string s, you are allowed to convert it to a palindrome by adding characters in front of it. Find and return the shortest palindrome you can find by performing this transformation.
 
 Example 1:
 Input: "aacecaaa"
 Output: "aaacecaaa"
 
 Example 2:
 Input: "abcd"
 Output: "dcbabcd"
 */

class Solution {
    func shortestPalindrome(_ s: String) -> String {
        if s.count < 2 { return s }
        let sArr = Array(s)
        let len = s.count
        // 按奇数
        var center = (len - 1) / 2
        while center >= 0 {
            if isPartPalindrom(sArr, center, true) {
                break
            }
            center -= 1
        }
        center = max(center, 0)
        let rst1 = sArr[center+1..<len].reversed() + sArr[center..<len]
        // 按偶数
        center = len / 2
        while center >= 0 {
            if isPartPalindrom(sArr, center, false) {
                break
            }
            center -= 1
        }
        center = max(center, 0)
        let rst2 = sArr[center..<len].reversed() + sArr[center..<len]
        print(rst1, rst2)
        return rst1.count < rst2.count ? String(rst1) : String(rst2)
    }
    
    func isPartPalindrom(_ str: [Character], _ center: Int, _ isOdd: Bool) -> Bool {
        var left = center - 1
        var right = isOdd ? center + 1 : center
        while left >= 0 {
            if str[left] != str[right] { return false }
            left -= 1
            right += 1
        }
        return true
    }
}

class Solution2 {
    func shortestPalindrome(_ s: String) -> String {
        var sExt = Array(s + "#" + s.reversed())
        var f = Array(repeating: 0, count: sExt.count)
        var t = f[0]
        
        for i in 1..<sExt.count {
            t = f[i - 1]
            while t > 0 && (sExt[i] != sExt[t]) {
                t = f[t - 1]
            }
            if sExt[i] == sExt[t] {
                t += 1
            }
            f[i] = t
        }
        return s.reversed()[0..<s.count - f[sExt.count - 1]] + s
    }
}

let s = Solution2()
s.shortestPalindrome("aacecaaa") // "aaacecaaa"
s.shortestPalindrome("abcd") // "dcbabcd"
s.shortestPalindrome("abb") // "bbabb"
s.shortestPalindrome("aabb") // "bbaabb"


