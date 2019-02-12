
import Foundation

/**
 Minimum Depth of Binary Tree
 
 Given a binary tree, find its minimum depth.
 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 Given binary tree [3,9,20,null,null,15,7],
   3
  / \
 9  20
   /  \
  15   7
 return its minimum depth = 2.
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

func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    if root.left == nil && root.right == nil { return 1 }
    else if root.left == nil && root.right != nil { return minDepth(root.right) + 1 }
    else if root.left != nil && root.right == nil { return minDepth(root.left) + 1 }
    else { return min(minDepth(root.left), minDepth(root.right)) + 1 }
}

let root1 = TreeNode(3)
root1.left = TreeNode(9)
root1.right = TreeNode(20)
root1.right?.left = TreeNode(15)
root1.right?.right = TreeNode(7)

minDepth(root1)
