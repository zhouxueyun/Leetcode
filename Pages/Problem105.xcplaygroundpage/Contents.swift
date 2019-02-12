
import Foundation

/**
 Construct Binary Tree from Preorder and Inorder Traversal
 
 Given preorder and inorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 For example, given
 
 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:
   3
  / \
 9  20
   /  \
  15   7
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

func preorderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    print(node.val, terminator: " ")
    preorderPrint(node.left)
    preorderPrint(node.right)
}

func printTreeNodePreorder(_ root: TreeNode?) {
    preorderPrint(root)
    print()
}

func inorderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    inorderPrint(node.left)
    print(node.val, terminator: " ")
    inorderPrint(node.right)
}

func printTreeNodeInorder(_ root: TreeNode?) {
    inorderPrint(root)
    print()
}

var preIdx = 0
var inIdx = 0

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    return buildTree(preorder, inorder, Int.max)
}

func buildTree(_ preorder: [Int], _ inorder: [Int], _ root: Int) -> TreeNode? {
    if inIdx == inorder.count || inorder[inIdx] == root {
        return nil
    }
    let node = TreeNode(preorder[preIdx])
    preIdx += 1
    node.left = buildTree(preorder, inorder, node.val);
    inIdx += 1
    node.right = buildTree(preorder, inorder, root);
    return node;
}

let root = buildTree([3,9,20,15,7], [9,3,15,20,7])
printTreeNodePreorder(root)
printTreeNodeInorder(root)
