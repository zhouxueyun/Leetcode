
import Foundation

/**
 Symmetric Tree
 
 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
     1
    / \
   2   2
  / \ / \
 3  4 4  3
 
 But the following [1,2,2,null,3,null,3] is not:
     1
    / \
   2   2
    \   \
    3    3
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

func isSymmetric(_ root: TreeNode?) -> Bool {
    if root == nil { return true }
    return helper(root?.left, root?.right)
}

func helper(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    if p != nil && q != nil && p!.val == q!.val {
        return helper(p?.left, q?.right) && helper(p?.right, q?.left)
    }
    return false
}

let root1 = TreeNode(1)
root1.left = TreeNode(2)
root1.right = TreeNode(2)
root1.left?.left = TreeNode(3)
root1.left?.right = TreeNode(4)
root1.right?.left = TreeNode(4)
root1.right?.right = TreeNode(3)

isSymmetric(root1)

let root2 = TreeNode(1)
root2.left = TreeNode(2)
root2.right = TreeNode(2)
root2.left?.right = TreeNode(3)
root2.right?.right = TreeNode(3)

isSymmetric(root2)

