//: [Previous](@previous)

import Foundation

/**
 Combination Sum II
 
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 Each number in candidates may only be used once in the combination.
 
 Note:
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 
 Example 1:
 Input: candidates = [10,1,2,7,6,1,5], target = 8,
 A solution set is:
 [
    [1, 7],
    [1, 2, 5],
    [2, 6],
    [1, 1, 6]
 ]
 
 Example 2:
 Input: candidates = [2,5,2,1,2], target = 5,
 A solution set is:
 [
    [1,2,2],
    [5]
 ]
 */

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    if candidates.isEmpty { return [] }
    let candi = candidates.sorted()
    var ret = [[Int]]()
    var curr = [Int]()
    helper(candi, target, 0, &ret, &curr)
    return ret
}

func helper(_ candidates: [Int], _ target: Int, _ pos: Int, _ result: inout [[Int]], _ current: inout [Int]) {
    if target == 0 {
        result.append(Array(current))
    }
    for i in pos..<candidates.count {
        if i > pos && candidates[i] == candidates[i-1] { continue }
        let num = candidates[i]
        if num > target { break }
        current.append(num)
        helper(candidates, target - num, i + 1, &result, &current)
        current.removeLast()
    }
}

print(combinationSum2([10,1,2,7,6,1,5], 8))
print(combinationSum2([2,5,2,1,2], 5))
