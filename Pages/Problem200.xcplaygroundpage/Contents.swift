
import Foundation

/**
 Number of Islands
 
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 Example 1:
 
 Input:
 11110
 11010
 11000
 00000
 
 Output: 1
 Example 2:
 
 Input:
 11000
 11000
 00100
 00011
 
 Output: 3
*/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var islands = 0
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                islands += sink(&grid, i, j)
            }
        }
        return islands
    }
    
    func sink(_ grid: inout [[Character]], _ i: Int, _ j: Int) -> Int {
        if i<0 || i>=grid.count || j<0 || j>=grid[0].count || grid[i][j] == "0" {
            return 0
        }
        grid[i][j] = "0"
        sink(&grid, i-1, j)
        sink(&grid, i+1, j)
        sink(&grid, i, j-1)
        sink(&grid, i, j+1)
        return 1
    }
}


let s = Solution()
s.numIslands([
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"],
    ])
s.numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"],
    ])

