
import Foundation

/**
 Best Time to Buy and Sell Stock IV
 
 Say you have an array for which the ith element is the price of a given stock on day i.
 Design an algorithm to find the maximum profit. You may complete at most k transactions.
 
 Note:
 You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
 
 Example 1:
 Input: [2,4,1], k = 2
 Output: 2
 Explanation: Buy on day 1 (price = 2) and sell on day 2 (price = 4), profit = 4-2 = 2.
 
 Example 2:
 Input: [3,2,6,5,0,3], k = 2
 Output: 7
 Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4.
 Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
 */

func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
    if k == 0 || prices.isEmpty { return 0 }
    if k >= prices.count/2 { return solveMaxProfit(prices) }
    var global = [Int](repeating: 0, count: k+1)
    var local = [Int](repeating: 0, count: k+1)
    for i in 0..<prices.count-1 {
        let diff = prices[i+1] - prices[i]
        print(diff)
        for j in 1...k {
            local[j] = max(global[j-1] + max(diff, 0), local[j] + diff)
            global[j] = max(global[j], local[j])
        }
        print(local)
        print(global)
    }
    return global[k];
}

func solveMaxProfit(_ prices: [Int]) -> Int {
    var ret = 0
    for i in 1..<prices.count {
        ret += max(prices[i] - prices[i-1], 0)
    }
    return ret;
}


maxProfit(2, [2,4,1])
maxProfit(2, [3,2,6,5,0,3])
