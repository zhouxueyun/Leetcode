import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var ret = 0
    for i in nums {
        ret ^= i
    }
    return ret
}

singleNumber([1, 1, 2])
singleNumber([1, 1, 2, 2, 4])
