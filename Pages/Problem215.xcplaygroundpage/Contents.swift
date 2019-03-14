
import Foundation

/**
 Kth Largest Element in an Array
 
 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
 
 Example 1:
 Input: [3,2,1,5,6,4] and k = 2
 Output: 5
 
 Example 2:
 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ array's length.
 */

// 解法二：最小堆 O(n*logn)
class Solution {
    
    class MinHeap {
        var capacity = 0
        var heap = [Int]()
        
        init(_ capacity: Int) {
            assert(capacity > 0)
            self.capacity = capacity
        }
        
        func top() -> Int? {
            return heap.first
        }
        
        func update(_ num: Int) -> Int? {
            if heap.count < capacity {
                heap.append(num)
                shiftup(heap.count - 1)
                print(heap)
            } else if num > heap.first! {
                let old = heap.first!
                heap[0] = num
                shiftdown(0)
                print(heap)
                return old
            }
            return nil
        }
        
        func shiftup(_ index: Int) {
            if index <= 0 { return }
            let pIndex = (index - 1) >> 1
            if heap[index] < heap[pIndex] {
                heap.swapAt(index, pIndex)
                shiftup(pIndex)
            }
        }
        
        func shiftdown(_ index: Int) {
            if index < 0 { return }
            let lIndex = (index << 1) + 1
            let rIndex = (index << 1) + 2
            if lIndex >= capacity { return }
            if rIndex < capacity {
                if heap[rIndex] < heap[lIndex] && heap[index] > heap[rIndex] {
                    heap.swapAt(index, rIndex)
                    shiftdown(rIndex)
                } else if heap[index] > heap[lIndex] {
                    heap.swapAt(index, lIndex)
                    shiftdown(lIndex)
                }
            } else if heap[index] > heap[lIndex] {
                heap.swapAt(index, lIndex)
                shiftdown(lIndex)
            }
        }
    }
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = MinHeap(k)
        for num in nums {
            heap.update(num)
        }
        return heap.top()!
    }
    
}


// 解法二：类似快排思路 O(n)
class Solution2 {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let randomIndex = Int.random(in: 0..<nums.count)
        let partitionNum = nums[randomIndex]
        nums.swapAt(randomIndex, nums.count - 1)
        nums.popLast()
        
        // 按照一个pivot，将 nums 分成两部分，> pivot 放左边，<= pivot 放右边
        let rightStart = nums.partition { $0 < partitionNum }
        var largerNums = Array(nums[0..<rightStart])
        if largerNums.count == k - 1 { // 当左边数目等于 k - 1 时， pivot 就为第K个大的值
            return partitionNum
        } else if largerNums.count > k - 1 { // 左边多
            return findKthLargest(largerNums, k)
        } else { // 右边多
            let smallerNums = Array(nums[rightStart..<nums.count])
            return findKthLargest(smallerNums, k - 1 - largerNums.count)
        }
    }
}

let s = Solution2()
s.findKthLargest([3,2,1,5,6,4], 2)
s.findKthLargest([3,2,3,1,2,4,5,5,6], 4)
