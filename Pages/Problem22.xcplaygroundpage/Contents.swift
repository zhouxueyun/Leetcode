
import Foundation

/**
 Generate Parentheses
 
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 [
    "((()))",
    "(()())",
    "(())()",
    "()(())",
    "()()()"
 ]
 */

func generateParenthesis(_ n: Int) -> [String] {
    var ret = [String]()
    if n <= 0 { return ret }
    getPair(&ret, "", n, n)
    return ret
}

func getPair(_ pairs: inout [String], _ s: String, _ left: Int, _ right: Int) {
    if left > right || left < 0 || right < 0 {
        return
    }
    if left == 0 && right == 0 {
        pairs.append(s)
    }
    getPair(&pairs, s+"(", left-1, right)
    getPair(&pairs, s+")", left, right-1)
}

print(generateParenthesis(2))
print(generateParenthesis(3))
print(generateParenthesis(4))
