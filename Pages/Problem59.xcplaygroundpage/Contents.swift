
import Foundation

/**
 Spiral Matrix II
 
 Given a positive integer n, generate a square matrix filled with elements from 1 to n^2 in spiral order.
 
 Example:
 Input: 3
 Output:
 [
    [ 1, 2, 3 ],
    [ 8, 9, 4 ],
    [ 7, 6, 5 ]
 ]
 */

func generateMatrix(_ n: Int) -> [[Int]] {
    if n == 0 { return [] }
    var matrix = (0..<n).map { _ in (0..<n).map( { _ in 0 }) }
    var startRow = 0
    var endRow = n - 1
    var startCol = 0
    var endCol = n - 1
    var current = 0
    while startRow <= endRow && startCol <= endCol {
        for j in stride(from: startCol, to: endCol+1, by: 1) {
            current += 1
            matrix[startRow][j] = current
        }
        for i in stride(from: startRow+1, to: endRow+1, by: 1) {
            current += 1
            matrix[i][endCol] = current
        }
        if startRow == endRow || startCol == endCol { break }
        for j in stride(from: endCol-1, to: startCol-1, by: -1) {
            current += 1
            matrix[endRow][j] = current
        }
        for i in stride(from: endRow-1, to: startRow, by: -1) {
            current += 1
            matrix[i][startCol] = current
        }
        startRow += 1
        endCol -= 1
        startCol += 1
        endRow -= 1
    }
    return matrix
}

generateMatrix(3)
generateMatrix(4)
generateMatrix(8)
