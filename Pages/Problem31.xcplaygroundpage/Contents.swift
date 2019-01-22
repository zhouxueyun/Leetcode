
import Foundation

/**
 Next Permutation
 
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 
 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 
 The replacement must be in-place and use only constant extra memory.
 
 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 */

func nextPermutation(_ nums: inout [Int]) {
    var i = nums.count - 2
    while i >= 0 && nums[i] >= nums[i+1] {
        i -= 1
    }
    if i >= 0 {
        var j = nums.count - 1
        while nums[j] <= nums[i] {
            j -= 1
        }
        nums.swapAt(i, j)
    }
    reverse(&nums, i+1, nums.count-1)
}

func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var start = start, end = end
    while start < end {
        nums.swapAt(start, end)
        start += 1
        end -= 1
    }
}

var nums = [1,2,3]
nextPermutation(&nums)
print(nums)

nums = [3,2,1]
nextPermutation(&nums)
print(nums)

nums = [1,1,5]
nextPermutation(&nums)
print(nums)
