
import Foundation

/**
 Binary Tree Inorder Traversal
 
 Given a binary tree, return the inorder traversal of its nodes' values.
 
 Example:
 Input: [1,null,2,3]
 1
  \
   2
  /
 3
 Output: [1,3,2]
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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return [Int]()
    }
    
    var ret = [Int]()
    
    var stack = [TreeNode]()
    stack.append(root)
    
    var flags = [Bool]() // 是否为新添加的根节点
    flags.append(true)
    
    while !stack.isEmpty {
        let flag = flags.popLast()!
        let node = stack.popLast()!
        if flag {
            if let right = node.right {
                stack.append(right)
                flags.append(true)
            }
            stack.append(node)
            flags.append(false)
            if let left = node.left {
                stack.append(left)
                flags.append(true)
            }
        } else {
            ret.append(node.val)
        }
    }
    
    return ret
}

let left = TreeNode(2)
left.left = TreeNode(4)
left.right = TreeNode(5)

let right = TreeNode(3)
right.left = TreeNode(6)
right.right = TreeNode(7)

let root = TreeNode(1)
root.left = left
root.right = right

inorderTraversal(root)
printTreeNode(root)
