
import Foundation

/**
 Contains Duplicate III
 
 Given an array of integers, find out whether there are two distinct indices i and j in the array such that the absolute difference between nums[i] and nums[j] is at most t and the absolute difference between i and j is at most k.
 
 Example 1:
 Input: nums = [1,2,3,1], k = 3, t = 0
 Output: true
 
 Example 2:
 Input: nums = [1,0,1,1], k = 1, t = 2
 Output: true
 
 Example 3:
 Input: nums = [1,5,9,1,5,9], k = 2, t = 3
 Output: false
 */

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var indices = nums.indices.sorted(by: { nums[$0] < nums[$1] })
        for i in 0 ..< indices.count {
            var x = indices[i]
            for j in (i + 1) ..< indices.count {
                var y = indices[j]
                if nums[y] - nums[x] > t { break } // diff with two nums should less or equal t
                if abs(x - y) <= k { return true } // diff with two index should less or equal k
            }
        }
        return false
    }
}

class Solution2 {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var set: Set<Int> = []
        for (index, num) in nums.enumerated() {
            if t == 0 { if set.contains(num) { return true } }
            else { if set.contains(where: { abs($0 - num) <= t }) { return true} }
            set.insert(num)
            if index >= k { set.remove(nums[index - k]) }
        }
        return false
    }
}

let s = Solution()
s.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0)
s.containsNearbyAlmostDuplicate([1,0,1,1], 1, 2)
s.containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3)
