
import Foundation

/**
 Majority Element II
 
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
 
 Note: The algorithm should run in linear time and in O(1) space.
 
 Example 1:
 Input: [3,2,3]
 Output: [3]
 
 Example 2:
 Input: [1,1,1,3,3,2,2,2]
 Output: [1,2]
 */

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        if nums.isEmpty { return [] }
        var targetA = nums[0], targetB = nums[0]
        var countA = 0, countB = 0
        for num in nums {
            if num == targetA { countA += 1 }
            else if num == targetB { countB += 1 }
            else if countA == 0 { targetA = num; countA += 1 }
            else if countB == 0 { targetB = num; countB += 1 }
            else { countA -= 1; countB -= 1 }
        }
        print(targetA, targetB)
        countA = 0; countB = 0
        for num in nums {
            if num == targetA { countA += 1 }
            else if num == targetB { countB += 1 }
        }
        var rst = [Int]()
        if countA > nums.count / 3 { rst.append(targetA) }
        if countB > nums.count / 3 { rst.append(targetB) }
        return rst
    }
}

let s = Solution()
s.majorityElement([3,3,3])
s.majorityElement([3,2,3])
s.majorityElement([1,1,1,3,3,2,2,2])
