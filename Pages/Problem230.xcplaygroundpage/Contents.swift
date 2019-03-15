
import Foundation

/**
 Kth Smallest Element in a BST
 
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
 
 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
 
 Example 1:
 Input: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
 Output: 1
 
 Example 2:
 Input: root = [5,3,6,2,4,null,null,1], k = 3
       5
      / \
     3   6
    / \
   2   4
  /
 1
 Output: 3
 
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
 */

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root = root else { return Int(Int32.min) }
        let cntLeft = countOfTree(root.left)
        if cntLeft > k - 1 {
            return kthSmallest(root.left, k)
        } else if cntLeft < k - 1 {
            return kthSmallest(root.right, k - 1 - cntLeft)
        }
        return root.val
    }
    
    func countOfTree(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return 1 + countOfTree(root?.left) + countOfTree(root?.right)
    }
    
    func kthSmallest1(_ root: TreeNode?, _ k: Int) -> Int {
        var cnt = 0
        return findK(root, k, &cnt)!
    }
    
    func findK(_ root: TreeNode?, _ k: Int, _ count: inout Int) -> Int? {
        guard let root = root else { return nil}
        if let rst = findK(root.left, k, &count) {
            return rst
        }
        count += 1
        if count == k { return root.val }
        return findK(root.right, k, &count)
    }
}


let root1 = TreeNode(3)
root1.left = TreeNode(1)
root1.right = TreeNode(4)
root1.left?.right = TreeNode(2)

let root2 = TreeNode(5)
root2.left = TreeNode(3)
root2.right = TreeNode(6)
root2.left?.left = TreeNode(2)
root2.left?.right = TreeNode(4)
root2.left?.left?.left = TreeNode(1)

let s = Solution()
s.kthSmallest1(root1, 1)
s.kthSmallest1(root2, 3)
