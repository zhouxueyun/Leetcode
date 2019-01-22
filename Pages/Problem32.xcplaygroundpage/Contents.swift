
import Foundation

/**
 Longest Valid Parentheses
 
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
 
 Example 1:
 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 
 Example 2:
 Input: ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()"
 */

func longestValidParentheses(_ s: String) -> Int {
    if s.count < 2 { return 0 }
    var ret = 0
    var start = 0
    var stack = [Int]()
    for (index, ch) in s.enumerated() {
        if String(ch) == "(" {
            stack.append(index)
        } else {
            if let top = stack.popLast() {
                if stack.isEmpty {
                    ret = max(ret, index - start + 1)
                } else {
                    ret = max(ret, index - stack.last!)
                }
            } else {
                start = index + 1
            }
        }
    }
    return ret
}

longestValidParentheses("(()")
longestValidParentheses(")()())")
longestValidParentheses("()(()")
longestValidParentheses("()(())")

