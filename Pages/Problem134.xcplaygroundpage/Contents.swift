import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    var sum = 0
    var total = 0
    var index = -1
    for i in 0 ..< gas.count {
        let remain = gas[i] - cost[i]
        sum += remain
        total += remain
        if sum < 0 {
            index = i
            sum = 0
        }
    }
    return total < 0 ? -1 : index + 1;
}

canCompleteCircuit([1, 2, 3, 4, 5], [3, 4, 5, 1, 2])


