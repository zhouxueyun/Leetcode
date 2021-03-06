//: [Previous](@previous)

import Foundation

/**
 Container With Most Water
 
 Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
 Note: You may not slant the container and n is at least 2.
 
 The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 Example:
 
 Input: [1,8,6,2,5,4,8,3,7]
 Output: 49
 */

func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count-1
    var ret = 0
    while left < right {
        print(left, right)
        let area = min(height[left], height[right]) * (right-left)
        ret = max(ret, area)
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    return ret
}

maxArea([1,8,6,2,5,4,8,3,7])
maxArea([2,3,4,5,18,17,6])
