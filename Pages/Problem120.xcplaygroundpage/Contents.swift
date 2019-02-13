
import Foundation

/**
 Triangle
 
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
 
 For example, given the following triangle
 
 [
    [2],
   [3,4],
  [6,5,7],
 [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
 
 Note:
 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 */

func minimumTotal(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else { return 0 }
    var dp = triangle.last!
    var rowIndex = triangle.count - 2
    while rowIndex >= 0 {
        let row = triangle[rowIndex]
        for j in 0..<row.count {
            dp[j] = min(dp[j], dp[j+1]) + row[j]
        }
        rowIndex -= 1
    }
    return dp[0]
}

minimumTotal([
    [2],
    [3,4],
    [6,5,7],
    [4,1,8,3]
    ])
