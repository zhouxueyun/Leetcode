
import Foundation

/**
 Excel Sheet Column Title
 
 Given a positive integer, return its corresponding column title as appear in an Excel sheet.

 For example:
 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 ...
 
 Example 1:
 Input: 1
 Output: "A"
 
 Example 2:
 Input: 28
 Output: "AB"
 
 Example 3:
 Input: 701
 Output: "ZY"
 */

func convertToTitle(_ n: Int) -> String {
    let adder = Int(UnicodeScalar("A")!.value - 1)
    var ret = ""
    var num = n
    while num != 0 {
        var remain = num % 26
        if remain == 0 { remain = 26 }
        ret = String(Character(UnicodeScalar(adder + remain)!)) + ret
        num = (num - remain) / 26
    }
    return ret
}

convertToTitle(1)
convertToTitle(28)
convertToTitle(701)
