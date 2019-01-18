
import Foundation

func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    tokens.forEach { (token) in
        if token == "+" {
            let right = stack.popLast()!
            let left = stack.popLast()!
            stack.append(left + right)
        } else if token == "-" {
            let right = stack.popLast()!
            let left = stack.popLast()!
            stack.append(left - right)
        } else if token == "*" {
            let right = stack.popLast()!
            let left = stack.popLast()!
            stack.append(left * right)
        } else if token == "/" {
            let right = stack.popLast()!
            let left = stack.popLast()!
            stack.append(left / right)
        } else if let val = Int(token) {
            stack.append(val)
        }
    }
    return stack.popLast()!
}


//Input: ["2", "1", "+", "3", "*"]
//Output: 9
evalRPN(["2", "1", "+", "3", "*"])

//Input: ["4", "13", "5", "/", "+"]
//Output: 6
evalRPN(["4", "13", "5", "/", "+"])

//Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
//Output: 22
evalRPN(["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"])


