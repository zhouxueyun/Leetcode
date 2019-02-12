
import Foundation

/**
 Binary Tree Zigzag Level Order Traversal
 
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
   3
  / \
 9  20
   /  \
  15   7
 
 return its zigzag level order traversal as:
 [
    [3],
    [20,9],
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

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    var ret = [[Int]]()
    var l = 0
    var level = [TreeNode]()
    level.append(root)
    while !level.isEmpty {
        l += 1
        var curRet = [Int]()
        var curLevel = [TreeNode]()
        for node in level {
            curRet.append(node.val)
            if let left = node.left { curLevel.append(left) }
            if let right = node.right { curLevel.append(right) }
        }
        ret.append(l % 2 == 0 ? curRet.reversed() : curRet)
        level = curLevel
    }
    return ret
}

let root1 = TreeNode(3)
root1.left = TreeNode(9)
root1.right = TreeNode(20)
root1.right?.left = TreeNode(15)
root1.right?.right = TreeNode(7)

zigzagLevelOrder(root1)
