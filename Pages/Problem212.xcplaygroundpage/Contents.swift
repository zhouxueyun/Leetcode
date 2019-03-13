
import Foundation

/**
 Word Search II
 
 Given a 2D board and a list of words from the dictionary, find all words in the board.
 
 Each word must be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.
 
 Example:
 
 Input:
 words = ["oath","pea","eat","rain"] and board =
 [
 ["o","a","a","n"],
 ["e","t","a","e"],
 ["i","h","k","r"],
 ["i","f","l","v"]
 ]
 
 Output: ["eat","oath"]
 Note:
 You may assume that all inputs are consist of lowercase letters a-z.
 */

// 解法二: force loop + dfs
class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let set = Set(words)
        return set.filter({ findWords(board, $0) })
    }
    
    func findWords(_ board: [[Character]], _ word: String) -> Bool {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if findWordsDFS(board, i, j, Array(word), 0, &visited) { return true }
            }
        }
        return false
    }
    
    func findWordsDFS(_ board:[[Character]], _ i: Int, _ j: Int, _ word: [Character], _ index: Int, _ visited: inout [[Bool]]) -> Bool {
        if index == word.count { return true }
        if i < 0 || i >= board.count || j < 0 || j >= board[0].count
            || visited[i][j] || board[i][j] != word[index] {
            return false
        }
        visited[i][j] = true
        if findWordsDFS(board, i - 1, j, word, index + 1, &visited) { return true }
        if findWordsDFS(board, i + 1, j, word, index + 1, &visited) { return true }
        if findWordsDFS(board, i, j - 1, word, index + 1, &visited) { return true }
        if findWordsDFS(board, i, j + 1, word, index + 1, &visited) { return true }
        visited[i][j] = false
        return false
    }
}

// 解法二: TrieNode + dfs
class Solution2 {
    class TrieNode {
        var isFinal = false
        var childs = [Character: TrieNode]()
    }
    
    func buildTrie(_ words: [String]) -> TrieNode {
        let root = TrieNode()
        for word in words {
            insert(root, word)
        }
        return root
    }
    
    func insert(_ root: TrieNode, _ word: String) {
        var node = root
        for c in word {
            if node.childs[c] == nil {
                node.childs[c] = TrieNode()
            }
            node = node.childs[c]!
        }
        node.isFinal = true
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        guard board.count > 0 else { return [] }
        
        let trie = buildTrie(words)
        let n = board.count
        let m = board[0].count
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
        var rst = [String]()
        
        for i in 0..<n {
            for j in 0..<m {
                dfs(board, i, j, trie, "", &visited, &rst)
            }
        }
        
        return rst
    }
    
    func dfs(_ board: [[Character]], _ i: Int, _ j: Int, _ trie: TrieNode, _ str: String, _ visited: inout [[Bool]], _ rst: inout [String]) {
        guard i >= 0 && i < board.count && j >= 0 && j < board[0].count && !visited[i][j] else { return }
        
        let ch = board[i][j]
        guard let node = trie.childs[ch] else { return }
        
        let str = str + String(ch)
        if node.isFinal && !rst.contains(str) {
            rst.append(str)
        }
        
        visited[i][j] = true
        dfs(board, i - 1, j, node, str, &visited, &rst)
        dfs(board, i + 1, j, node, str, &visited, &rst)
        dfs(board, i, j - 1, node, str, &visited, &rst)
        dfs(board, i, j + 1, node, str, &visited, &rst)
        visited[i][j] = false
    }
    
}

let board: [[Character]] = [
    ["o","a","a","n"],
    ["e","t","a","e"],
    ["i","h","k","r"],
    ["i","f","l","v"]
]
let words = ["oath","pea","eat","rain"]

let s = Solution2()
s.findWords(board, words)
