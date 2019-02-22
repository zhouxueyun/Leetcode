
import Foundation

/**
 Valid Palindrome
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome.
 
 Example 1:
 Input: "A man, a plan, a canal: Panama"
 Output: true
 
 Example 2:
 Input: "race a car"
 Output: false
 */

func isPalindrome(_ s: String) -> Bool {
    let arr = Array(s.lowercased())
    var left = 0
    var right = arr.count - 1
    while left < right {
        while left < right && !isAlphaNum(arr[left]) {
            left += 1
        }
        while left < right && !isAlphaNum(arr[right]) {
            right -= 1
        }
        if left < right && arr[left] != arr[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

func isAlphaNum(_ c: Character) -> Bool {
    return (c >= "0" && c <= "9") || (c >= "a" && c <= "z")
}

isPalindrome("0P")
isPalindrome(".,")
isPalindrome("A man, a plan, a canal: Panama")
isPalindrome("race a car")
