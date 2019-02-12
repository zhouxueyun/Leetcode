
import Foundation

/**
 Same Tree
 
 Given two binary trees, write a function to check if they are the same or not.
 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
 Example 1:
 Input:
   1         1
  / \       / \
 2   3     2   3
 [1,2,3],   [1,2,3]
 Output: true
 
 Example 2:
 Input:
   1         1
  /           \
 2             2
 [1,2],     [1,null,2]
 Output: false
 
 Example 3:
 Input:
   1         1
  / \       / \
 2   1     1   2
 [1,2,1],   [1,1,2]
 Output: false
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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    if p != nil && q != nil && p!.val == q!.val {
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    return false
}

let root11 = TreeNode(1)
root11.left = TreeNode(2)
root11.right = TreeNode(3)
let root12 = TreeNode(1)
root12.left = TreeNode(2)
root12.right = TreeNode(3)
isSameTree(root11, root12)

let root21 = TreeNode(1)
root21.left = TreeNode(2)
let root22 = TreeNode(1)
root22.right = TreeNode(2)
isSameTree(root21, root22)

let root31 = TreeNode(1)
root31.left = TreeNode(1)
root31.right = TreeNode(2)
let root32 = TreeNode(1)
root32.left = TreeNode(2)
root32.right = TreeNode(1)
isSameTree(root31, root32)
