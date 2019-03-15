
import Foundation

/**
 Basic Calculator
 
 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .
 
 Example 1:
 Input: "1 + 1"
 Output: 2
 
 Example 2:
 Input: " 2-1 + 2 "
 Output: 3
 
 Example 3:
 Input: "(1+(4+5+2)-3)+(6+8)"
 Output: 23
 
 Note:
 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 */

class Solution {
    func calculate(_ s: String) -> Int {
        var num = 0, res = 0, sign = 1, st = [Int]()
        for c in s {
            if c == " " { continue }
            else if c == "+" || c == "-" {
                res += sign*num
                num = 0
                sign = c == "+" ? 1: -1
            }
            else if c == "(" {
                st.append(res)
                st.append(sign)
                res = 0
                sign = 1
            }
            else if c == ")" {
                res += sign*num
                num = 0
                res *= st.removeLast()
                res += st.removeLast()
            }
            else {
                num = num*10 + Int(String(c))!
            }
        }
        res += sign*num
        return res
    }
}

let s = Solution()
s.calculate("1 + 1") // 2
s.calculate(" 2-1 + 2 ") // 3
s.calculate("(1+(4+5+2)-3)+(6+8)") // 23
