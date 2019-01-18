import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var a = 0
    var b = 0
    for c in nums {
        b = b ^ c & ~a
        a = a ^ c & ~b
    }
    return b
}

singleNumber([1, 1, 1, 2])
singleNumber([1, 1, 1,  2, 2, 2, 99])
