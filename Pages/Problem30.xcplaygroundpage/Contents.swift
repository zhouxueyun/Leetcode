
import Foundation

/**
 Substring with Concatenation of All Words
 
 You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
 
 Example 1:
 
 Input:
 s = "barfoothefoobarman",
 words = ["foo","bar"]
 Output: [0,9]
 Explanation: Substrings starting at index 0 and 9 are "barfoor" and "foobar" respectively.
 The output order does not matter, returning [9,0] is fine too.
 Example 2:
 
 Input:
 s = "wordgoodgoodgoodbestword",
 words = ["word","good","best","word"]
 Output: []
 */

func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    if s.isEmpty || words.isEmpty { return [] }
    let strArr = Array(s)
    var ret = [Int]()
    var m1 = [String: Int]()
    words.forEach({ if let count = m1[$0] { m1[$0] = count + 1 } else { m1[$0] = 1 } })
    let wordLen = words[0].count
    for i in 0..<wordLen {
        var index = i
        var count = 0
        var m2 = [String: Int]()
        for j in stride(from: i, to: s.count-wordLen+1, by: wordLen) {
            let word = String(strArr[j..<j+wordLen])
            if let cnt = m1[word] {
                if let c = m2[word] { m2[word] = c + 1 } else { m2[word] = 1 }
                if m2[word]! <= cnt { // 可控次数
                    count += 1
                } else { // 次数超出预期
                    while m2[word]! > cnt { // 从之前的记录删除word
                        let tmp = String(strArr[index..<index+wordLen])
                        if let c = m2[tmp] {
                            m2[tmp] = c - 1
                            // 移除与word不同的单词
                            if m2[tmp]! < m1[tmp]! { count -= 1 }
                        }
                        index += wordLen
                    }
                }
                if count == words.count {
                    ret.append(index)
                    // 移除第一个单词，并且位置向后移
                    let tmp = String(strArr[index..<index+wordLen])
                    m2[tmp] = m2[tmp]! - 1
                    index += wordLen
                    count -= 1
                }
            } else {
                // 不符合条件，跳过
                m2.removeAll()
                count = 0
                index = j + wordLen
            }
        }
    }
    return ret
}

findSubstring("barfoothefoobarman", ["foo","bar"])
findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"])
findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"])
findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"])
