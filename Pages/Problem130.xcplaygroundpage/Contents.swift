
import Foundation

/**
 Surrounded Regions
 
 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
 
 A region is captured by flipping all 'O's into 'X's in that surrounded region.
 
 Example:
 X X X X
 X O O X
 X X O X
 X O X X
 
 After running your function, the board should be:
 X X X X
 X X X X
 X X X X
 X O X X
 
 Explanation:
 Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 */

func solve(_ board: inout [[Character]]) {
    if board.isEmpty || board[0].isEmpty { return }
    let row = board.count
    let col = board[0].count
    for i in 0..<row {
        if board[i][0] == "O" { helper(&board, i, 0) }
        if board[i][col-1] == "O" { helper(&board, i, col-1) }
    }
    for j in 0..<col {
        if board[0][j] == "O" { helper(&board, 0, j) }
        if board[row-1][j] == "O" { helper(&board, row-1, j) }
    }
    for i in 0..<row {
        for j in 0..<col {
            if board[i][j] == "1" { board[i][j] = "O" }
            else if board[i][j] == "O" { board[i][j] = "X" }
        }
    }
}

func helper(_ board: inout [[Character]], _ i: Int, _ j: Int) {
    if board[i][j] != "O" { return }
    board[i][j] = "1"
    if i+1 < board.count { helper(&board, i+1, j) }
    if j+1 < board[0].count { helper(&board, i, j+1) }
    if i-1 >= 0 { helper(&board, i-1, j) }
    if j-1 >= 0 { helper(&board, i, j-1) }
}

var board: [[Character]] = [
    ["X","X", "X", "X"],
    ["X","O", "O", "X"],
    ["X","X", "O", "X"],
    ["X","O", "X", "X"],
    ]
solve(&board)
print(board)
