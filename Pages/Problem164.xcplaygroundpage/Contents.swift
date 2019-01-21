
import Foundation

/**
 Maximum Gap
 
 Given an unsorted array, find the maximum difference between the successive elements in its sorted form.
 Return 0 if the array contains less than 2 elements.
 
 Example 1:
 Input: [3,6,9,1]
 Output: 3
 Explanation: The sorted form of the array is [1,3,6,9], either
 (3,6) or (6,9) has the maximum difference 3.
 
 Example 2:
 Input: [10]
 Output: 0
 Explanation: The array contains less than 2 elements, therefore return 0.

 Note:
 You may assume all elements in the array are non-negative integers and fit in the 32-bit signed integer range.
 Try to solve it in linear time/space.
 */

func maximumGap(_ nums: [Int]) -> Int {
    if nums.count < 2 { return 0 }
    let sorted = nums.sorted()
    var maxGap = 0
    for i in 1..<sorted.count {
        maxGap = max(sorted[i] - sorted[i-1], maxGap)
    }
    return maxGap
}

func maximumGap1(_ nums: [Int]) -> Int {
    if nums.count < 2 { return 0 }
    
    let size = nums.count
    let maxNum = nums.reduce(Int.min, { max($0, $1) })
    let minNum = nums.reduce(Int.max, { min($0, $1) })
    if maxNum == minNum { return 0 }
    
    let gap = Double(maxNum - minNum) / Double(size - 1)
    var maxV = [Int](repeating: Int.min, count: size - 1)
    var minV = [Int](repeating: Int.max, count: size - 1)
    
    for i in 0..<size {
        if nums[i] == maxNum { continue }
        let bucketId = Int(Double(nums[i] - minNum) / gap)
        minV[bucketId] = min(nums[i], minV[bucketId])
        maxV[bucketId] = max(nums[i], maxV[bucketId])
    }
    
    var ret = 0
    var curMax = maxV[0];
    for i in 0..<size-1 {
        if minV[i] == Int.max { continue }
        ret = max(ret, minV[i] - curMax)
        curMax = maxV[i]
    }
    ret = max(ret, maxNum - curMax)
    return ret
}

maximumGap1([3,6,9,1])
maximumGap1([3,6,9,1,11,14,4])
maximumGap1([3,6,9,1,18,20,5,30])
maximumGap1([1,1,1,1])
maximumGap1([10])
