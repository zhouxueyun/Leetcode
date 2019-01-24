
import Foundation

/**
 Length of Last Word
 
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
 
 If the last word does not exist, return 0.
 
 Note: A word is defined as a character sequence consists of non-space characters only.
 
 Example:
 Input: "Hello World"
 Output: 5
 */

func lengthOfLastWord(_ s: String) -> Int {
    var length = 0
    var started = false
    for ch in s.reversed() {
        if ch == Character(" ") {
            if started { break }
        } else {
            started = true
            length += 1
        }
    }
    return length
}

lengthOfLastWord("Hello World")
lengthOfLastWord("Hello World     ")
lengthOfLastWord("World     ")
