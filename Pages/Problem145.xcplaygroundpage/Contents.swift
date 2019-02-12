
import Foundation

/**
 Binary Tree Postorder Traversal
 
 Given a binary tree, return the postorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
  \
  2
  /
 3
 
 Output: [3,2,1]
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

func postorderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    postorderPrint(node.left)
    postorderPrint(node.right)
    print(node.val, terminator: " ")
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
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
            stack.append(node)
            flags.append(false)
            if let right = node.right {
                stack.append(right)
                flags.append(true)
            }
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
//left.left = TreeNode(4)
left.right = TreeNode(5)

let right = TreeNode(3)
right.left = TreeNode(6)
//right.right = TreeNode(7)

let root = TreeNode(1)
root.left = left
root.right = right

postorderTraversal(root)
postorderPrint(root)
print()
