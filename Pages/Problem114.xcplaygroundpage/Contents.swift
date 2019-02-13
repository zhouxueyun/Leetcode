
import Foundation

/**
 Flatten Binary Tree to Linked List
 
 Given a binary tree, flatten it to a linked list in-place.
 
 For example, given the following tree:
     1
    / \
   2   5
  / \   \
 3   4   6
 
 The flattened tree should look like:
 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
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

func printTreeNodeRight(_ root: TreeNode?) {
    var root = root
    while root != nil {
        print(root!.val, terminator: " ")
        root = root?.right
    }
    print()
}

func printTreeNodePreOrder(_ root: TreeNode?) {
    preorderPrint(root)
    print()
}

func preorderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    print(node.val, terminator: " ")
    preorderPrint(node.left)
    preorderPrint(node.right)
}

func flatten(_ root: TreeNode?) {
    preorderConnect(root)
    moveNodeToRight(root)
}

func preorderConnect(_ root: TreeNode?) -> TreeNode? {
    if root == nil { return nil }
    var tail = root
    if let leftTail = preorderConnect(root?.left) {
        tail = leftTail
    }
    tail?.left = root?.right // connect
    if let rightTail = preorderConnect(root?.right) {
        tail = rightTail
    }
    return tail;
}

func moveNodeToRight(_ root: TreeNode?) {
    var root = root
    while root != nil {
        root?.right = root?.left
        root?.left = nil
        root = root?.right
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.left?.left = TreeNode(3)
root.left?.right = TreeNode(4)
root.right = TreeNode(5)
root.right?.right = TreeNode(6)

printTreeNodePreOrder(root)
flatten(root)
printTreeNodeRight(root)
