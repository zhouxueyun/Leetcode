
import Foundation

/**
 Scramble String
 
 Given a string s1, we may represent it as a binary tree by partitioning it to two non-empty substrings recursively.
 
 Below is one possible representation of s1 = "great":
 
     great
    /    \
   gr    eat
  / \    /  \
 g   r  e   at
            / \
           a   t
 To scramble the string, we may choose any non-leaf node and swap its two children.
 
 For example, if we choose the node "gr" and swap its two children, it produces a scrambled string "rgeat".
 
     rgeat
    /    \
   rg    eat
  / \    /  \
 r   g  e   at
            / \
           a   t
 We say that "rgeat" is a scrambled string of "great".
 
 Similarly, if we continue to swap the children of nodes "eat" and "at", it produces a scrambled string "rgtae".
 
     rgtae
    /    \
   rg    tae
  / \    /  \
 r   g  ta  e
       / \
      t   a
 We say that "rgtae" is a scrambled string of "great".
 
 Given two strings s1 and s2 of the same length, determine if s2 is a scrambled string of s1.
 
 Example 1:
 Input: s1 = "great", s2 = "rgeat"
 Output: true
 
 Example 2:
 Input: s1 = "abcde", s2 = "caebd"
 Output: false
 */

func isScramble(_ s1: String, _ s2: String) -> Bool {
    if s1.count != s2.count { return false }
    let arr1 = Array(s1)
    let arr2 = Array(s2)
    let count = arr1.count
    
    var dp = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: count), count: count), count: count)
    for k in 0..<count {
        for i in 0..<count-k {
            for j in 0..<count-k {
                if k == 0 { dp[k][i][j] = (arr1[i] == arr2[j]) }
                else {
                    for q in 0..<k {
                        if (dp[q][i][j] && dp[k-q-1][i+q+1][j+q+1]) ||
                            (dp[q][i][j+k-q] && dp[k-q-1][i+q+1][j]) {
                            dp[k][i][j] = true
                            break
                        }
                    }
                }
            }
        }
    }
    
    return dp[count-1][0][0]
}

isScramble("great", "rgate")
isScramble("abcde", "caebd")
isScramble("ab", "aa")
isScramble("bba", "abb")
isScramble("abc", "acb")
isScramble("abcdefghijklmnopq","efghijklmnopqcadb")
