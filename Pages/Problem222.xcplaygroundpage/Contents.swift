
import Foundation

/**
 Count Complete Tree Nodes
 
 Given a complete binary tree, count the number of nodes.
 
 Note:
 
 Definition of a complete binary tree from Wikipedia:
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
 
 Example:
 
 Input:
     1
    / \
   2   3
  / \  /
 4  5 6
 
 Output: 6
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
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var count = 0
        var queue = [root]
        while !queue.isEmpty {
            var newQueue = [TreeNode?]()
            var foundNil = false
            for node in queue {
                if node == nil { foundNil = true; break }
                count += 1
                newQueue.append(node?.left)
                newQueue.append(node?.right)
            }
            if foundNil { break }
            queue = newQueue
        }
        return count
    }
    
    func countNodes1(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        return 1 + countNodes1(root?.left) + countNodes1(root?.right)
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)

let s = Solution()
s.countNodes(root)
