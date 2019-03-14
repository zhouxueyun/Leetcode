//: [Previous](@previous)

import Foundation

/**
 Contains Duplicate II
 
 Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
 
 Example 1:
 Input: nums = [1,2,3,1], k = 3
 Output: true
 
 Example 2:
 Input: nums = [1,0,1,1], k = 1
 Output: true
 
 Example 3:
 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
 */

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            if let idx = map[nums[i]], i - idx <= k { return true } 
            map[nums[i]] = i
        }
        return false
    }
}

let s = Solution()
s.containsNearbyDuplicate([1,2,3,1], 3)
s.containsNearbyDuplicate([1,0,1,1], 1)
s.containsNearbyDuplicate([1,2,3,1,2,3], 2)
