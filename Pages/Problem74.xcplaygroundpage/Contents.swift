
import Foundation

/**
 Search a 2D Matrix
 
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 
 Example 1:
 Input:
 matrix = [
    [1,   3,  5,  7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
 ]
 target = 3
 Output: true
 
 Example 2:
 Input:
 matrix = [
    [1,   3,  5,  7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
 ]
 target = 13
 Output: false
 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    if matrix.isEmpty || matrix[0].isEmpty { return false }
    var row = 0, col = matrix[0].count-1
    while row < matrix.count && col >= 0 {
        if matrix[row][col] > target {
            col -= 1
        } else if matrix[row][col] < target {
            row += 1
        } else {
            return true
        }
    }
    return false
}

searchMatrix([
    [1,   3,  5,  7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
    ], 3)
searchMatrix([
    [1,   3,  5,  7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
    ], 13)
