//: [Previous](@previous)

import Foundation

/**
 Find Peak Element
 
 A peak element is an element that is greater than its neighbors.
 Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.
 
 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.
 You may imagine that nums[-1] = nums[n] = -∞.
 
 Example 1:
 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 
 Example 2:
 Input: nums = [1,2,1,3,5,6,4]
 Output: 1 or 5
 Explanation: Your function can return either index number 1 where the peak element is 2,
 or index number 5 where the peak element is 6.
 Note:
 
 Your solution should be in logarithmic complexity.
 */

func findPeakElement(_ nums: [Int], start: Int, end: Int) -> Int? {
    if start >= end {
        return nil
    }
    if (start == 0 || nums[start] > nums[start-1]) && nums[start] > nums[start+1] {
        return start
    }
    if (end == nums.count - 1 || nums[end] > nums[end+1] ) && nums[end] > nums[end-1] {
        return end
    }
    let mid = start + (end - start) / 2
    if let index = findPeakElement(nums, start: start, end: mid) {
        return index
    }
    if let index = findPeakElement(nums, start: mid+1, end: end) {
        return index
    }
    return nil
}

func findPeakElement(_ nums: [Int]) -> Int {
    if nums.count < 2 {
        return 0
    }
    return findPeakElement(nums, start: 0, end: nums.count - 1) ?? -1
}

func findPeakElement1(_ nums: [Int]) -> Int {
    let size = nums.count
    for i in 0..<size {
        if (i==0||nums[i-1]<nums[i]) && (i+1==size||nums[i+1]<nums[i]) { return i }
    }
    return -1;
}

findPeakElement([1,2,3,1]) //  Output: 2
findPeakElement([1,2,1,3,5,6,4]) //  Output: 1 or 5
findPeakElement([1]) //  Output: 0

