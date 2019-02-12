
import Foundation

/**
 Binary Tree Level Order Traversal
 
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
   3
  / \
 9  20
   /  \
  15   7
 
 return its level order traversal as:
 [
    [3],
    [9,20],
    [15,7]
 ]
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var ret = [[Int]]()
    var level = [TreeNode]()
    level.append(root)
    while !level.isEmpty {
        var curLevel = [TreeNode]()
        var curRet = [Int]()
        for node in level {
            curRet.append(node.val)
            if let left = node.left { curLevel.append(left) }
            if let right = node.right { curLevel.append(right) }
        }
        ret.append(curRet)
        level = curLevel
    }
    return ret
}

let root1 = TreeNode(3)
root1.left = TreeNode(9)
root1.right = TreeNode(20)
root1.right?.left = TreeNode(15)
root1.right?.right = TreeNode(7)

levelOrder(root1)
