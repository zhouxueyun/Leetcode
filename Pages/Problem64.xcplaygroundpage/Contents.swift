
import Foundation

/**
 Minimum Path Sum
 
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 
 Example:
 Input:
 [
    [1,3,1],
    [1,5,1],
    [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 */

func minPathSum(_ grid: [[Int]]) -> Int {
    if grid.isEmpty || grid[0].isEmpty { return Int(Int32.max) }
    var grid = grid
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if i==0 && j==0 {
                continue
            }
            else if i==0 {
                grid[i][j] += grid[i][j-1]
            }
            else if j==0 {
                grid[i][j] += grid[i-1][j]
            }
            else {
                grid[i][j] += min(grid[i-1][j], grid[i][j-1])
            }
            print(grid)
        }
    }
    return grid.last!.last!
}

minPathSum([
    [1,3,1],
    [1,5,1],
    [4,2,1]
    ])
