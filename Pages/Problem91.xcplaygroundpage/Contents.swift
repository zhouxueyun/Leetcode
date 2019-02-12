
import Foundation

/**
 Decode Ways
 
 A message containing letters from A-Z is being encoded to numbers using the following mapping:
 "A" -> 1
 "B" -> 2
 ...
 "Z" -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.
 
 Example 1:
 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 
 Example 2:
 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 */

func numDecodings(_ s: String) -> Int {
    if s.count == 0 { return 0 }
    var num1 = 1
    var num2 = 1
    var num3 = 1
    let arr = Array(s)
    if arr[0] == "0" { return 0 }
    for i in 1..<arr.count {
        if arr[i]=="0" {
            if arr[i-1]=="1" || arr[i-1]=="2" {
                num3 = num1
            } else {
                return 0
            }
        } else {
            if arr[i-1]=="0" || arr[i-1]>="3" {
                num3 = num2
            } else {
                if arr[i-1]=="2" && arr[i]>="7" && arr[i]<="9" {
                    num3 = num2
                } else {
                    num3 = num1 + num2
                }
            }
        }
        num1 = num2
        num2 = num3
    }
    return num2
}

numDecodings("01")
numDecodings("12")
numDecodings("226")
