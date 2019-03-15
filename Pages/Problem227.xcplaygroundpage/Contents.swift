
import Foundation

/**
 Basic Calculator II
 
 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.
 
 Example 1:
 Input: "3+2*2"
 Output: 7
 
 Example 2:
 Input: " 3/2 "
 Output: 1
 
 Example 3:
 Input: " 3+5 / 2 "
 Output: 5
 
 Note:
 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 */

class Solution {
    func calculate(_ s: String) -> Int {
        var num = 0, sign = 1, opt = 1, rst = 0, rst_opt = 1
        for ch in (s+"+") {
            if ch == " " { continue }
            if ch == "+" || ch == "-" {
                rst_opt = opt == 1 ? rst_opt * num : rst_opt / num
                rst += rst_opt * sign
                sign = ch == "+" ? 1 : -1
                num = 0
                rst_opt = 1
                opt = 1
            }
            else if ch == "*" || ch == "/" {
                rst_opt = opt == 1 ? rst_opt * num : rst_opt / num
                opt = ch == "*" ? 1 : -1
                num = 0
            }
            else {
                num = num * 10 + Int(String(ch))!
            }
        }
        return rst
    }
}

let s = Solution()
s.calculate("3+2*2") // 7
s.calculate(" 3/2 ") // 1
s.calculate(" 3+5 / 2 ") // 5
