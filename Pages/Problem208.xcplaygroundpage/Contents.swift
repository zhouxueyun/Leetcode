
import Foundation

/**
 Implement Trie (Prefix Tree)
 
 Implement a trie with insert, search, and startsWith methods.
 
 Example:
 
 Trie trie = new Trie();
 
 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");
 trie.search("app");     // returns true
 Note:
 
 You may assume that all inputs are consist of lowercase letters a-z.
 All inputs are guaranteed to be non-empty strings.
 */

class Trie {
    
    var isLeaf: Bool
    var childs: [Character: Trie]
    
    /** Initialize your data structure here. */
    init() {
        self.isLeaf = false
        self.childs = [Character: Trie]()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        if word.isEmpty { return }
        let wordArr = Array(word)
        var t = self
        for i in 0..<wordArr.count {
            var child = t.childs[wordArr[i]]
            if child == nil {
                child = Trie()
                t.childs[wordArr[i]] = child
            }
            t = child!
        }
        t.isLeaf = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        let wordArr = Array(word)
        var t = self
        for i in 0..<wordArr.count {
            if let child = t.childs[wordArr[i]] { t = child }
            else { return false }
        }
        return t.isLeaf
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        let prefixArr = Array(prefix)
        var t = self
        for i in 0..<prefixArr.count {
            if let child = t.childs[prefixArr[i]] { t = child }
            else { return false }
        }
        return true
    }
    
    func printTrie() {
        var queue = [Trie]()
        queue.append(self)
        while !queue.isEmpty {
            var newQueue = [Trie]()
            for node in queue {
                print(node.isLeaf, terminator: " ")
                newQueue.append(contentsOf: node.childs.values)
            }
            print()
            queue = newQueue
        }
    }
}

let trie = Trie();

trie.insert("apple");
trie.printTrie()

trie.search("apple");   // returns true
trie.search("app");     // returns false
trie.startsWith("app"); // returns true
trie.insert("app");
trie.printTrie()

trie.search("app");     // returns true
