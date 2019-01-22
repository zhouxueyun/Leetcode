
import Foundation

/**
 Letter Combinations of a Phone Number
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 Example:
 Input: "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

func letterCombinations(_ digits: String) -> [String] {
    var ret = [String]()
    if digits.count == 0 { return ret }
    let map = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl",
               "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
    digits.forEach { (digit) in
        let chars = Array(map[String(digit)]!)
        if ret.isEmpty {
            ret = chars.map({ return String($0) })
        } else {
            ret = ret.flatMap({ (pre) -> [String] in
                return chars.map({ return pre + String($0) })
            })
        }
    }
    return ret
}

print(letterCombinations("23"))
