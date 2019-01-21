
import Foundation

/**
 3Sum
 
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note:
 The solution set must not contain duplicate triplets.
 
 Example:
 Given array nums = [-1, 0, 1, 2, -1, -4],
 A solution set is:
 [
    [-1, 0, 1],
    [-1, -1, 2]
 ]
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    var ret = [[Int]]()
    if nums.count < 3 { return ret }
    let sorted = nums.sorted()
    for index in 0..<sorted.count-2 {
        if index > 0 && sorted[index] == sorted[index-1] {
            continue
        }
        var start = index + 1
        var end = sorted.count - 1
        while start < end {
            let sum = sorted[index] + sorted[start] + sorted[end]
            if sum < 0 {
                start += 1
            } else if sum > 0 {
                end -= 1
            } else {
                ret.append([sorted[index], sorted[start], sorted[end]])
                start += 1
                end -= 1
                while start < end && sorted[start] == sorted[start-1] {
                    start += 1
                }
                while start < end && sorted[end] == sorted[end+1] {
                    end -= 1
                }
            }
        }
    }
    return ret
}

threeSum([-1, 0, 1, 2, -1, -4])
