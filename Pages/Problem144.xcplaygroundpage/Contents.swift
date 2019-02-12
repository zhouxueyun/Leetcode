
import UIKit

/**
 Binary Tree Preorder Traversal
 
 Given a binary tree, return the preorder traversal of its nodes' values.
 Example:
 Input: [1,null,2,3]
 1
  \
   2
  /
 3
 
 Output: [1,2,3]
 Follow up: Recursive solution is trivial, could you do it iteratively?
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

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return [Int]()
    }
    
    var ret = [Int]()
    
    var stack = [TreeNode]()
    stack.append(root)
    
    while !stack.isEmpty {
        let node = stack.popLast()!
        ret.append(node.val)
        
        // push the right
        if let right = node.right {
            stack.append(right)
        }
        
        // push the left
        if let left = node.left {
            stack.append(left)
        }
    }
    
    return ret
}

let left = TreeNode(2)
//left.left = TreeNode(4)
left.right = TreeNode(5)

let right = TreeNode(3)
right.left = TreeNode(6)
//right.right = TreeNode(7)

let root = TreeNode(1)
root.left = left
root.right = right

preorderTraversal(root)
preorderPrint(root)




