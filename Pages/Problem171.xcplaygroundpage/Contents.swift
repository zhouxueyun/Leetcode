
import Foundation

/**
 Excel Sheet Column Number
 
 Given a column title as appear in an Excel sheet, return its corresponding column number.
 
 For example:
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
 
 Example 1:
 Input: "A"
 Output: 1
 
 Example 2:
 Input: "AB"
 Output: 28
 
 Example 3:
 Input: "ZY"
 Output: 701
 */

func titleToNumber(_ s: String) -> Int {
    var number = 0
    for i in 0 ..< s.count {
        let c = s[s.index(s.startIndex, offsetBy: i)]
        let num = Int(UnicodeScalar(String(c))!.value) - Int(UnicodeScalar("A")!.value) + 1
        number = number * 26 + num
    }
    return number
}

titleToNumber("A")
titleToNumber("AB")
titleToNumber("ZY")

