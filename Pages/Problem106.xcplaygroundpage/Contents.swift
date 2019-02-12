
import Foundation

/**
 Construct Binary Tree from Inorder and Postorder Traversal
 
 Given inorder and postorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 For example, given
 
 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
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

func postorderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    postorderPrint(node.left)
    postorderPrint(node.right)
    print(node.val, terminator: " ")
}

func printTreeNodePostorder(_ root: TreeNode?) {
    postorderPrint(root)
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

var postIdx = 0
var inIdx = 0

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    inIdx = inorder.count - 1
    postIdx = postorder.count - 1
    return buildTree(inorder, postorder, Int.max)
}

func buildTree(_ inorder: [Int], _ postorder: [Int], _ root: Int) -> TreeNode? {
    if inIdx < 0 || inorder[inIdx] == root {
        return nil
    }
    let node = TreeNode(postorder[postIdx])
    postIdx -= 1
    node.right = buildTree(inorder, postorder, node.val);
    inIdx -= 1
    node.left = buildTree(inorder, postorder, root);
    return node;
}

let root = buildTree([9,3,15,20,7], [9,15,7,20,3])
printTreeNodeInorder(root)
printTreeNodePostorder(root)
