
import Foundation

/**
 Add Binary
 
 Given two binary strings, return their sum (also a binary string).
 
 The input strings are both non-empty and contains only characters 1 or 0.
 
 Example 1:
 Input: a = "11", b = "1"
 Output: "100"
 
 Example 2:
 Input: a = "1010", b = "1011"
 Output: "10101"
 */


func addBinary(_ a: String, _ b: String) -> String {
    let arrA = a.reversed().map { return Int(String($0))! }
    let arrB = b.reversed().map { return Int(String($0))! }
    var ret = [Int]()
    var carry = 0, indexA = 0, indexB = 0
    while indexA < arrA.count && indexB < arrB.count {
        let num = arrA[indexA] + arrB[indexB] + carry
        ret.append(num % 2)
        carry = num / 2
        indexA += 1; indexB += 1
    }
    while indexA < arrA.count {
        let num = arrA[indexA] + carry
        ret.append(num % 2)
        carry = num / 2
        indexA += 1
    }
    while indexB < arrB.count {
        let num = arrB[indexB] + carry
        ret.append(num % 2)
        carry = num / 2
        indexB += 1
    }
    while carry > 0 {
        ret.append(carry % 2)
        carry /= 2
    }
    return ret.reversed().reduce("", { $0 + String($1) })
}

addBinary("11", "1")
addBinary("1010", "1011")
