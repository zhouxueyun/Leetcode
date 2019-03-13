
import Foundation

/**
 Add and Search Word - Data structure design
 
 Design a data structure that supports the following two operations:
 void addWord(word)
 bool search(word)
 
 search(word) can search a literal word or a regular expression string containing only letters a-z or .. A . means it can represent any one letter.
 
 Example:
 addWord("bad")
 addWord("dad")
 addWord("mad")
 search("pad") -> false
 search("bad") -> true
 search(".ad") -> true
 search("b..") -> true
 
 Note:
 You may assume that all words are consist of lowercase letters a-z.
 */

// 解法一: TrieNode
class WordDictionary {
    
    class TrieNode {
        var isFinal = false
        var letters = [Character : TrieNode]()
    }
    
    let root = TrieNode()
    
    /** Initialize your data structure here. */
    init() {
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var current = root
        for c in word {
            if let next = current.letters[c] {
                current = next
            } else {
                let next = TrieNode()
                current.letters[c] = next
                current = next
            }
        }
        current.isFinal = true
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return searchImpl(root, Array(word), 0)
    }
    
    func searchImpl(_ node: TrieNode, _ word: [Character], _ index: Int) -> Bool {
        if index == word.count { return node.isFinal }
        let char = word[index]
        if char == "." {
            for (_, next) in node.letters {
                if searchImpl(next, word, index + 1) { return true }
            }
            return false
        } else if let next = node.letters[char] {
            return searchImpl(next, word, index + 1)
        } else {
            return false
        }
    }
}

// 解法二: Dictionary<Int: Array<String>>
class WordDictionary1 {
    
    var dict: [Int: [String]]
    
    /** Initialize your data structure here. */
    init() {
        dict = [Int: [String]]()
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        if let _ = dict[word.count] {
            dict[word.count]!.append(word)
        } else {
            dict[word.count] = [word]
        }
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        if !word.contains(".") { return dict[word.count]?.contains(word) ?? false }
        else {
            let wordArr = Array(word)
            for w in dict[word.count] ?? [] {
                let wArr = Array(w)
                var bBreak = false
                for i in 0..<wordArr.count {
                    if wordArr[i] != wArr[i] && wordArr[i] != "." { bBreak = true; break }
                }
                if !bBreak { return true }
            }
            return false
        }
    }
}

let wd = WordDictionary()

wd.addWord("bad")
wd.addWord("dad")
wd.addWord("mad")
wd.search("pad") // false
wd.search("bad") // true
wd.search(".ad") // true
wd.search("b..") // true
