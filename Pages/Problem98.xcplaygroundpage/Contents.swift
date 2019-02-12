
import Foundation

/**
 Validate Binary Search Tree
 
 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 Example 1:
 
 Input:
   2
  / \
 1   3
 Output: true
 Example 2:
 
   5
  / \
 1   4
    / \
   3   6
 Output: false
 Explanation: The input is: [5,1,4,null,null,3,6]. The root node's value
 is 5 but its right child's value is 4.
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

func inorderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    inorderPrint(node.left)
    print(node.val, terminator: " ")
    inorderPrint(node.right)
}

func printTreeNode(_ root: TreeNode?) {
    inorderPrint(root)
    print()
}

func isValidBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    var prev: TreeNode? = nil
    var valid = true
    isValidBST(root, &prev, &valid)
    return valid
}

func isValidBST(_ root: TreeNode?, _ prev: inout TreeNode?, _ valid: inout Bool) {
    guard valid && root != nil else { return }
    isValidBST(root?.left, &prev, &valid)
    if prev != nil && prev!.val >= root!.val {
        valid = false
        return
    }
    prev = root
    isValidBST(root?.right, &prev, &valid)
}

let root = TreeNode(2)
root.left = TreeNode(1)
root.right = TreeNode(3)

printTreeNode(root)
isValidBST(root)

let root2 = TreeNode(5)
root2.left = TreeNode(1)
root2.right = TreeNode(4)
root2.right?.left = TreeNode(3)
root2.right?.right = TreeNode(6)

printTreeNode(root2)
isValidBST(root2)

