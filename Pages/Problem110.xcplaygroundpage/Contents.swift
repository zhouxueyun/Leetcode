
import Foundation

/**
 Balanced Binary Tree
 
 Given a binary tree, determine if it is height-balanced.
 
 For this problem, a height-balanced binary tree is defined as:
 a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example 1:
 Given the following tree [3,9,20,null,null,15,7]:
    3
   / \
  9  20
    /  \
   15   7
 Return true.
 
 Example 2:
 Given the following tree [1,2,2,3,3,null,null,4,4]:
       1
      / \
     2   2
    / \
   3   3
  / \
 4   4
 Return false.
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

func isBalanced(_ root: TreeNode?) -> Bool {
    return depthOfTree(root) != -1
}

func depthOfTree(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    let depthLeft = depthOfTree(root.left)
    if depthLeft == -1 { return -1 }
    let depthRight = depthOfTree(root.right)
    if depthRight == -1 { return -1 }
    if abs(depthRight - depthLeft) > 1 { return -1 }
    return max(depthLeft, depthRight) + 1
}

let root1 = TreeNode(3)
root1.left = TreeNode(9)
root1.right = TreeNode(20)
root1.right?.left = TreeNode(15)
root1.right?.right = TreeNode(7)

isBalanced(root1)
