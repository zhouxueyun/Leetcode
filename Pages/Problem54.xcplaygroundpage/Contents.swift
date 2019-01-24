
import Foundation

/**
 Spiral Matrix
 
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 Example 1:
 Input:
 [
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
 ]
 Output: [1,2,3,6,9,8,7,4,5]
 
 Example 2:
 Input:
 [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9,10,11,12]
 ]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    if matrix.isEmpty || matrix[0].isEmpty { return [] }
    var ret = [Int]()
    var startRow = 0
    var endRow = matrix.count - 1
    var startCol = 0
    var endCol = matrix[0].count - 1
    while startRow <= endRow && startCol <= endCol {
        for j in stride(from: startCol, to: endCol+1, by: 1) {
            ret.append(matrix[startRow][j])
        }
        for i in stride(from: startRow+1, to: endRow+1, by: 1) {
            ret.append(matrix[i][endCol])
        }
        if startRow == endRow || startCol == endCol { break }
        for j in stride(from: endCol-1, to: startCol-1, by: -1) {
            ret.append(matrix[endRow][j])
        }
        for i in stride(from: endRow-1, to: startRow, by: -1) {
            ret.append(matrix[i][startCol])
        }
        startRow += 1
        endCol -= 1
        startCol += 1
        endRow -= 1
    }
    return ret
}

spiralOrder([
    [ 1, 2, 3 ],
    [ 4, 5, 6 ],
    [ 7, 8, 9 ]
    ])
spiralOrder([
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9,10,11,12]
    ])
spiralOrder([
    [1, 2, 3]
    ])
spiralOrder([
    [1],
    [2],
    [3]
    ])
spiralOrder([
    [1, 2, 3],
    [4, 5, 6]
    ])
spiralOrder([
    [1, 2],
    [3, 4],
    [5, 6]
    ])


