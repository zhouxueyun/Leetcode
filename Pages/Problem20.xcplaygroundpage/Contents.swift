
import Foundation

/**
 Valid Parentheses
 
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 
 Example 1:
 Input: "()"
 Output: true
 
 Example 2:
 Input: "()[]{}"
 Output: true
 
 Example 3:
 Input: "(]"
 Output: false
 
 Example 4:
 Input: "([)]"
 Output: false
 
 Example 5:
 Input: "{[]}"
 Output: true
 */

func isValid(_ s: String) -> Bool {
    if s.isEmpty { return true }
    var stack = [Character]()
    let left: Set<Character> = ["(", "[", "{"]
    let right: Set<Character> = [")", "]", "}"]
    for ch in Array(s) {
        if stack.isEmpty {
            stack.append(ch)
        } else {
            let last = stack.last!
            if isPair(last, ch) {
                stack.popLast()
            } else if left.contains(last) && right.contains(ch) {
                return false
            } else {
                stack.append(ch)
            }
        }
    }
    return stack.isEmpty
}

func isPair(_ ch1: Character, _ ch2: Character) -> Bool {
    return (ch1 == Character("(") && ch2 == Character(")")) ||
        (ch1 == Character("[") && ch2 == Character("]")) ||
        (ch1 == Character("{") && ch2 == Character("}"))
}

isValid("()")
isValid("()[]{}")
isValid("(]")
isValid("([)]")
isValid("{[]}")
