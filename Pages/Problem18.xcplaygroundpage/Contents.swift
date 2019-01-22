
import Foundation

/**
 4Sum
 
 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
 
 Note:
 
 The solution set must not contain duplicate quadruplets.
 
 Example:
 
 Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
 
 A solution set is:
 [
    [-1,  0, 0, 1],
    [-2, -1, 1, 2],
    [-2,  0, 0, 2]
 ]
 */

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 { return [] }
    var ret = [[Int]]()
    let sorted = nums.sorted()
    for i in 0..<sorted.count-3 {
        if i > 0 && sorted[i] == sorted[i-1] {
            continue
        }
        for j in i+1..<sorted.count-2 {
            if j > i+1 && sorted[j] == sorted[j-1] {
                continue
            }
            var start = j + 1
            var end = sorted.count - 1
            while start < end {
                let sum = sorted[i] + sorted[j] + sorted[start] + sorted[end]
                if sum < target {
                    start += 1
                } else if sum > target {
                    end -= 1
                } else {
                    ret.append([sorted[i], sorted[j], sorted[start], sorted[end]])
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
    }
    return ret
}

fourSum([1, 0, -1, 0, -2, 2], 0)
fourSum([0,0,0,0], 0)
fourSum([-3,-2,-1,0,0,1,2,3], 0)

