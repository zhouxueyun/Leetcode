
import Foundation

/**
 Maximal Rectangle
 
 Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.
 
 Example:
 Input:
 [
    ["1","0","1","0","0"],
    ["1","0","1","1","1"],
    ["1","1","1","1","1"],
    ["1","0","0","1","0"]
 ]
 Output: 6
 */

func maximalRectangle(_ matrix: [[Character]]) -> Int {
    if matrix.isEmpty || matrix[0].isEmpty { return 0 }
    var ret = 0
    var heights = [Int](repeating: 0, count: matrix[0].count)
    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            heights[j] = matrix[i][j] == "0" ? 0 : (1 + heights[j])
        }
        ret = max(ret, largestRectangleArea(heights))
    }
    return ret
}

func largestRectangleArea(_ heights: [Int]) -> Int {
    var ret = 0
    var stack = [Int]()
    for index in 0...heights.count {
        while !stack.isEmpty &&
            (index == heights.count || heights[stack.last!] >= heights[index]) {
                let curr = stack.popLast()!
                ret = max(ret, heights[curr] * (stack.isEmpty ? index : (index-stack.last!-1)))
        }
        stack.append(index)
    }
    return ret
}

let board: [[Character]] = [
    ["1","0","1","0","0"],
    ["1","0","1","1","1"],
    ["1","1","1","1","1"],
    ["1","0","0","1","0"]
]
maximalRectangle(board)
