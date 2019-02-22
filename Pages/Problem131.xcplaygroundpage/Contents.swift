
import Foundation

/**
 Palindrome Partitioning
 
 Given a string s, partition s such that every substring of the partition is a palindrome.
 Return all possible palindrome partitioning of s.
 
 Example:
 Input: "aab"
 Output:
 [
    ["aa","b"],
    ["a","a","b"]
 ]
 */

func partition(_ s: String) -> [[String]] {
    if s.isEmpty { return [] }
    var ret = [[String]]()
    var path = [String]()
    helper(0, Array(s), &path, &ret);
    return ret;
}

func helper(_ index: Int, _ arr: [Character], _ path: inout [String], _ ret: inout [[String]]) {
    if index >= arr.count { ret.append(path) }
    else {
        for i in index..<arr.count {
            if isPalindrome(arr, index, i) {
                path.append(String(arr[index...i]))
                helper(i+1, arr, &path, &ret)
                path.popLast()
            }
        }
    }
}

func isPalindrome(_ arr: [Character], _ start: Int, _ end: Int) -> Bool {
    var start = start
    var end = end
    while start <= end {
        if arr[start] != arr[end] {
            return false
        }
        start += 1
        end -= 1
    }
    return true
}

partition("aab")
