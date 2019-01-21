//: [Previous](@previous)

import Foundation

/**
 3Sum Closest
 
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 Example:
 
 Given array nums = [-1, 2, 1, -4], and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 3 { return Int.max }
    
    var closet = Int.max / 2
    let sorted = nums.sorted()
    
    for i in 0..<sorted.count-2 {
        if i > 0 && sorted[i] == sorted[i-1] {
            continue
        }
        var start = i+1
        var end = sorted.count-1
        while start < end {
            let sum = sorted[i] + sorted[start] + sorted[end]
            if sum < target {
                start += 1
            } else if sum > target {
                end -= 1
            } else {
                return sum
            }
            closet = abs(closet-target) < abs(sum-target) ? closet : sum
        }
    }

    return closet
}

threeSumClosest([-1, 2, 1, -4], 1)
threeSumClosest([1,1,1,1], -100)
