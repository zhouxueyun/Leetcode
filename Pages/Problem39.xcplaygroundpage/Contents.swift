
import Foundation

/**
 Combination Sum
 
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times.
 
 Note:
 
 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 
 Example 1:
 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
    [7],
    [2,2,3]
 ]
 
 Example 2:
 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
    [2,2,2,2],
    [2,3,3],
    [3,5]
 ]
 */

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
        let num = candidates[i]
        if num > target { break }
        current.append(num)
        helper(candidates, target - num, i, &result, &current)
        current.removeLast()
    }
}

print(combinationSum([2,3,6,7], 7))
print(combinationSum([2,3,5], 8))
