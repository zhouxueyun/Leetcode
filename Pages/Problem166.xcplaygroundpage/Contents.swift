//: [Previous](@previous)

import Foundation

/**
 Fraction to Recurring Decimal
 
 Given two integers representing the numerator and denominator of a fraction, return the fraction in string format.
 If the fractional part is repeating, enclose the repeating part in parentheses.
 
 Example 1:
 Input: numerator = 1, denominator = 2
 Output: "0.5"
 
 Example 2:
 Input: numerator = 2, denominator = 1
 Output: "2"
 
 Example 3:
 Input: numerator = 2, denominator = 3
 Output: "0.(6)"
 */

func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
    if numerator == 0 { return "0" }
    // 整数部分
    var ret = (numerator < 0 && denominator > 0) || (numerator > 0 && denominator < 0) ? "-" : ""
    ret.append(String(abs(numerator / denominator)))
    // 余数部分
    var remain = numerator % denominator
    if remain == 0 {
        return ret
    }
    ret.append(".")
    // 开始处理余数，如果余数已经出现过，则开始循环了
    var remainMap = [Int: Int]() // key 为 remain， value 为 index
    while remain != 0 {
        if let index = remainMap[remain] { // 余数重复,开始循环
            ret.insert("(", at: ret.index(ret.startIndex, offsetBy: index))
            ret.append(")")
            break
        }
        remainMap[remain] = ret.count
        // 求下一个余数
        let num = remain * 10
        ret.append(String(abs(num / denominator)))
        remain = num % denominator
    }
    return ret
}

fractionToDecimal(1, 2)
fractionToDecimal(2, 1)
fractionToDecimal(2, 3)
fractionToDecimal(2, 7)
fractionToDecimal(1, 6)
fractionToDecimal(-50, 8)
fractionToDecimal(7, -12)
