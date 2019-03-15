
import Foundation

/**
 Summary Ranges
 
 Given a sorted integer array without duplicates, return the summary of its ranges.
 
 Example 1:
 Input:  [0,1,2,4,5,7]
 Output: ["0->2","4->5","7"]
 Explanation: 0,1,2 form a continuous range; 4,5 form a continuous range.
 
 Example 2:
 Input:  [0,2,3,4,6,8,9]
 Output: ["0","2->4","6","8->9"]
 Explanation: 2,3,4 form a continuous range; 8,9 form a continuous range.
 */

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.isEmpty { return [] }
        var rst = [String]()
        var start = 0
        for i in 0...nums.count {
            if i == nums.count || (i>0 && nums[i] != nums[i-1] + 1) {
                var str = "\(nums[start])"
                if i > start+1 {
                    str += "->\(nums[i-1])"
                }
                start = i
                rst.append(str)
            }
        }
        return rst
    }
}

let s = Solution()
s.summaryRanges([0,1,2,4,5,7])
s.summaryRanges([0,2,3,4,6,8,9])
