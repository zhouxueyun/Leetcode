//: [Previous](@previous)

import Foundation

/**
 Path Sum
 
 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 Given the below binary tree and sum = 22,
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \      \
 7    2      1
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
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

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    guard let root = root else { return false }
    if root.left == nil && root.right == nil { return sum == root.val }
    return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
}

let root = TreeNode(5)
root.left = TreeNode(4)
root.left?.left = TreeNode(11)
root.left?.left?.left = TreeNode(7)
root.left?.left?.right = TreeNode(2)
root.right = TreeNode(8)
root.right?.left = TreeNode(13)
root.right?.right = TreeNode(4)
root.right?.right?.right = TreeNode(1)

hasPathSum(root, 22)
hasPathSum(root, 18)
