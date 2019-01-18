
import Foundation

func findMin(_ nums: [Int]) -> Int {
    var start = 0
    var end = nums.count - 1
    while start < end {
        if nums[start] < nums[end] {
            break
        }
        let mid = start + (end - start) / 2
        if nums[mid] > nums[end] {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return nums[start]
}

func findMin2(_ nums: [Int]) -> Int {
    var pivot = -1
    for i in 1 ..< nums.count {
        if nums[i] < nums[i-1] {
            pivot = i
            break
        }
    }
    if pivot < 0 {
        pivot = 0
    }
    return nums[start]
}

func findMin1(_ nums: [Int]) -> Int {
    var start = 0
    var end = nums.count - 1
    while start < end && nums[start] >= nums[end] {
        let mid = start + (end - start) / 2
        if nums[mid] > nums[end] {
            start = mid + 1
        } else if nums[mid] < nums[start] {
            end = mid
        } else {
            start += 1
        }
    }
    return nums[start]
}


findMin([1,2,3,4,5,6,7])
findMin([2,3,4,5,6,7,1])
findMin([3,4,5,6,7,1,2])
findMin([4,5,6,7,1,2,3])
findMin([5,6,7,1,2,3,4])
findMin([6,7,1,2,3,4,5])
findMin([7,1,2,3,4,5,6])
