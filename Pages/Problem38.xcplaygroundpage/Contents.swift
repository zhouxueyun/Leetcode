
import Foundation

/**
 Count and Say
 
 The count-and-say sequence is the sequence of integers with the first five terms as following:
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.
 
 Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence.
 
 Note: Each term of the sequence of integers will be represented as a string.
 
 
 Example 1:
 Input: 1
 Output: "1"
 
 Example 2:
 Input: 4
 Output: "1211"
 */

func countAndSay(_ n: Int) -> String {
    var ret = "1"
    for _ in 1..<n {
        let retArr = Array(ret)
        var ch = retArr[0]
        var count = 1
        var str = ""
        for i in 1..<retArr.count {
            if retArr[i] == ch {
                count += 1
            } else {
                str.append(String(count))
                str.append(ch)
                ch = retArr[i]
                count = 1
            }
        }
        str.append(String(count))
        str.append(ch)
        ret = str
    }
    return ret
}

countAndSay(1)
countAndSay(2)
countAndSay(4)
countAndSay(30)
