
import Foundation

/**
 Path Sum II
 
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 Given the below binary tree and sum = 22,
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 Return:
 [
    [5,4,11,2],
    [5,8,4,5]
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

func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    var ret = [[Int]]()
    var cur = [Int]()
    helper(root, sum, &cur, &ret)
    return ret
}

func helper(_ root: TreeNode?, _ sum: Int, _ cur: inout [Int], _ ret: inout [[Int]]) {
    guard let root = root else { return }
    cur.append(root.val)
    if root.left == nil && root.right == nil && sum == root.val {
        ret.append(cur)
    }
    helper(root.left, sum - root.val, &cur, &ret)
    helper(root.right, sum - root.val, &cur, &ret)
    cur.removeLast()
}

let root = TreeNode(5)
root.left = TreeNode(4)
root.left?.left = TreeNode(11)
root.left?.left?.left = TreeNode(7)
root.left?.left?.right = TreeNode(2)
root.right = TreeNode(8)
root.right?.left = TreeNode(13)
root.right?.right = TreeNode(4)
root.right?.right?.left = TreeNode(5)
root.right?.right?.right = TreeNode(1)

pathSum(root, 22)
