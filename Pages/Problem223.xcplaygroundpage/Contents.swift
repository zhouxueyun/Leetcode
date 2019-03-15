
import Foundation

/**
 Rectangle Area
 
 Find the total area covered by two rectilinear rectangles in a 2D plane.
 Each rectangle is defined by its bottom left corner and top right corner as shown in the figure.
 
 Rectangle Area
 
 Example:
 Input: A = -3, B = 0, C = 3, D = 4, E = 0, F = -1, G = 9, H = 2
 Output: 45
 
 Note:
 Assume that the total area is never beyond the maximum possible value of int.
 */

class Solution {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        let area1 = abs(A - C) * abs(B - D)
        let area2 = abs(E - G) * abs(F - H)
        if A >= G || C <= E || B >= H || D <= F { return area1 + area2 }
        return area1 + area2 - abs((max(A, E) - min(C, G)) * (max(B, F) - min(D, H)))
    }
}

let s = Solution()
s.computeArea(-3, 0, 3, 4, 0, -1, 9, 2)
