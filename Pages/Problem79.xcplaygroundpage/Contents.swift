
import Foundation

/**
 Word Search
 
 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 Example:
 
 board =
 [
    ["A","B","C","E"],
    ["S","F","C","S"],
    ["A","D","E","E"]
 ]
 
 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
 */


func exist(_ board: [[Character]], _ word: String) -> Bool {
    if board.isEmpty || board[0].isEmpty { return false }
    if word.isEmpty { return false }
    var board = board
    var ret = false
    helper(&board, Array(word), 0, 0, 0, &ret)
    return ret
}

func helper(_ board: inout [[Character]], _ word: [Character], _ index: Int, _ i: Int, _ j: Int, _ ret: inout Bool) {
    if ret || index == word.count {
        ret = true
        return
    }
    if index == 0 {
        for r in 0..<board.count {
            for c in 0..<board[0].count {
                let ch = board[r][c]
                if ch == word[index] {
                    board[r][c] = "1"
                    helper(&board, word, index + 1, r, c, &ret)
                    board[r][c] = ch
                }
            }
        }
    } else {
        let ch = word[index]
        // up
        if i-1>=0 && board[i-1][j] == ch {
            board[i-1][j] = "1"
            helper(&board, word, index + 1, i - 1, j, &ret)
            board[i-1][j] = ch
        }
        // down
        if i+1<board.count && board[i+1][j] == ch {
            board[i+1][j] = "1"
            helper(&board, word, index + 1, i + 1, j, &ret)
            board[i+1][j] = ch
        }
        // left
        if j-1>=0 && board[i][j-1] == ch {
            board[i][j-1] = "1"
            helper(&board, word, index + 1, i, j - 1, &ret)
            board[i][j-1] = ch
        }
        // right
        if j+1<board[0].count && board[i][j+1] == ch {
            board[i][j+1] = "1"
            helper(&board, word, index + 1, i, j + 1, &ret)
            board[i][j+1] = ch
        }
    }
}

let  board: [[Character]] = [
    ["A","B","C","E"],
    ["S","F","C","S"],
    ["A","D","E","E"]
]


//exist(board, "ABCCED")
//exist(board, "SEE")
//exist(board, "ABCB")
exist([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]], "ABCESEEEFS")
