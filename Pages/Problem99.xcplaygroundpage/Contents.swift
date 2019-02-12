
import Foundation

/**
 Recover Binary Search Tree
 
 Two elements of a binary search tree (BST) are swapped by mistake.
 Recover the tree without changing its structure.
 
 Example 1:
 Input: [1,3,null,null,2]
   1
  /
 3
  \
   2
 Output: [3,1,null,null,2]
   3
  /
 1
  \
   2
 
 Example 2:
 Input: [3,1,4,null,null,2]
   3
  / \
 1   4
    /
   2
 Output: [2,1,4,null,null,3]
   2
  / \
 1   4
    /
   3
 
 Follow up:
 A solution using O(n) space is pretty straight forward.
 Could you devise a constant space solution?
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

var s1: TreeNode? = nil
var s2: TreeNode? = nil
var pre: TreeNode? = nil

func recoverTree(_ root: TreeNode?) {
    helper(root)
    // swap
    let tmp = s1?.val ?? 0
    s1?.val = s2?.val ?? 0
    s2?.val = tmp
}

func helper(_ root: TreeNode?) {
    guard let root = root else { return }
    helper(root.left)
    if pre != nil && pre!.val > root.val {
        if s1 == nil { s1 = pre }
        s2 = root
    }
    pre = root
    helper(root.right)
}

//let root1 = TreeNode(1)
//root1.left = TreeNode(3)
//root1.left?.right = TreeNode(2)
//printTreeNode(root1)
//recoverTree(root1)
//printTreeNode(root1)

let root2 = TreeNode(3)
root2.left = TreeNode(1)
root2.right = TreeNode(4)
root2.right?.left = TreeNode(2)
printTreeNode(root2)
recoverTree(root2)
printTreeNode(root2)
