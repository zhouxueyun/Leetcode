
import Foundation

/**
 Largest Rectangle in Histogram
 
 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
 
 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
 
 The largest rectangle is shown in the shaded area, which has area = 10 unit.
 
 Example:
 Input: [2,1,5,6,2,3]
 Output: 10
 */

func largestRectangleArea(_ heights: [Int]) -> Int {
    var ret = 0
    var stack = [Int]()
    for index in 0...heights.count {
        print(stack)
        while !stack.isEmpty &&
            (index == heights.count || heights[stack.last!] >= heights[index]) {
            let curr = stack.popLast()!
            ret = max(ret, heights[curr] * (stack.isEmpty ? index : (index-stack.last!-1)))
        }
        stack.append(index)
    }
    print(ret)
    return ret
}

largestRectangleArea([2,1,5,6,2,3])
largestRectangleArea([1,2,3,4,5,6])
largestRectangleArea([6,5,4,3,2,1])
largestRectangleArea([1,2,2])
