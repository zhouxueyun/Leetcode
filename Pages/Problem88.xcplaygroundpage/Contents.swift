
import Foundation

/**
 Merge Sorted Array
 
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 
 Example:
 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 Output: [1,2,2,3,5,6]
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var m = m - 1
    var n = n - 1
    while m >= 0 && n >= 0 {
        if nums1[m] > nums2[n] {
            nums1[m+n+1] = nums1[m]
            m -= 1
        } else {
            nums1[m+n+1] = nums2[n]
            n -= 1
        }
    }
    while n >= 0 {
        nums1[n] = nums2[n]
        n -= 1
    }
}

var nums1 = [1,2,3,0,0,0]
var nums2 = [2,5,6]
merge(&nums1, 3, nums2, 3)
print(nums1)
