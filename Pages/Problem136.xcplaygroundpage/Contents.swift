import Foundation

/**
 Single Number
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 Input: [2,2,1]
 Output: 1
 
 Example 2:
 Input: [4,1,2,1,2]
 Output: 4
 */

func singleNumber(_ nums: [Int]) -> Int {
    var ret = 0
    for i in nums {
        ret ^= i
    }
    return ret
}

singleNumber([1, 1, 2])
singleNumber([1, 1, 2, 2, 4])

func twoSingleNumber(_ nums: [Int]) -> (Int, Int) {
    guard nums.count >= 2 && nums.count % 2 == 0
        else { return (Int.min, Int.max) }
    // 全局求异或，得到两个仅出现一次的数字的异或
    var xor = nums.reduce(0, { return $0 ^ $1 })
    // 寻找异或结果中的第一个非0位置
    var indexOf1 = 0
    while xor & 1 == 0 && indexOf1 < Int.bitWidth {
        xor = xor >> 1
        indexOf1 += 1
    }
    // 按照此非0位置”0“or”1“将数组分为两部分进行处理
    var num1 = 0, num2 = 0
    for num in nums {
        if ((num >> indexOf1) & 1) == 1 { num1 ^= num }
        else { num2 ^= num }
    }
    return (num1, num2)
}

twoSingleNumber([1, 1, 2, 3])
twoSingleNumber([1, 1, 2, 2, 3, 4])
