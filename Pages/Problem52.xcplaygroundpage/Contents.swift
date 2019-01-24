
import Foundation

/**
 N-Queens II
 
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
 
 Given an integer n, return the number of distinct solutions to the n-queens puzzle.
 
 Example:
 Input: 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown below.
 [
    [".Q..",  // Solution 1
    "...Q",
    "Q...",
    "..Q."],
 
    ["..Q.",  // Solution 2
    "Q...",
    "...Q",
    ".Q.."]
 ]
 */

func totalNQueens(_ n: Int) -> Int {
    var ret = 0
    var state = [Int](repeating: -1, count: n)
    helper(&state, 0, &ret)
    return ret
}

func helper(_ state: inout [Int], _ row: Int, _ count: inout Int) {
    let n = state.count
    if row == n {
        count += 1
    } else {
        for col in 0..<n {
            if isValid(state, row, col) {
                state[row] = col
                helper(&state, row + 1, &count)
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

print(totalNQueens(4))
print(totalNQueens(8))
