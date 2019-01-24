
import Foundation

/**
 N-Queens
 
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
 
 Given an integer n, return all distinct solutions to the n-queens puzzle.
 
 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
 
 Example:
 Input: 4
 Output: [
    [".Q..",  // Solution 1
    "...Q",
    "Q...",
    "..Q."],
 
    ["..Q.",  // Solution 2
    "Q...",
    "...Q",
    ".Q.."]
 ]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
 */

func solveNQueens(_ n: Int) -> [[String]] {
    var ret = [[String]]()
    var state = [Int](repeating: -1, count: n)
    helper(&state, 0, &ret)
    return ret
}

func helper(_ state: inout [Int], _ row: Int, _ ret: inout [[String]]) {
    let n = state.count
    if row == n {
        var cur = [[Character]](repeating: [Character](repeating: ".", count: n), count: n)
        for i in 0..<n {
            cur[i][state[i]] = "Q"
        }
        ret.append(cur.map({String($0)}))
    } else {
        for col in 0..<n {
            if isValid(state, row, col) {
                state[row] = col
                helper(&state, row + 1, &ret)
                state[row] = -1
            }
        }
    }
}

func isValid(_ state: [Int], _ row: Int, _ col: Int) -> Bool {
    for i in 0..<row {
        if state[i] == col || abs(row - i) == abs(col - state[i]) {
            return false
        }
    }
    return true
}

print(solveNQueens(4))
print(solveNQueens(8))
