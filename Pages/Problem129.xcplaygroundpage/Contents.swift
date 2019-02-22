
import Foundation

/**
 Sum Root to Leaf Numbers
 
 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
 An example is the root-to-leaf path 1->2->3 which represents the number 123.
 Find the total sum of all root-to-leaf numbers.
 Note: A leaf is a node with no children.
 
 Example:
 Input: [1,2,3]
   1
  / \
 2   3
 Output: 25
 Explanation:
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 Therefore, sum = 12 + 13 = 25.
 
 Example 2:
 Input: [4,9,0,5,1]
     4
    / \
   9   0
  / \
 5   1
 Output: 1026
 Explanation:
 The root-to-leaf path 4->9->5 represents the number 495.
 The root-to-leaf path 4->9->1 represents the number 491.
 The root-to-leaf path 4->0 represents the number 40.
 Therefore, sum = 495 + 491 + 40 = 1026.
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

func sumNumbers(_ root: TreeNode?) -> Int {
    var numbers = [String]()
    helper(root, "", &numbers)
    return numbers.reduce(0, { $0 + (Int($1) ?? 0) })
}

func helper(_ root: TreeNode?, _ str: String, _ strs: inout [String]) {
    guard let root = root else { return }
    let num = str + String(root.val)
    if let left = root.left {
        helper(left, num, &strs)
    }
    if let right = root.right {
        helper(right, num, &strs)
    }
    if root.left == nil && root.right == nil {
        strs.append(num)
    }
}

let root1 = TreeNode(1)
root1.left = TreeNode(2)
root1.right = TreeNode(3)
sumNumbers(root1) // 25

let root2 = TreeNode(4)
root2.left = TreeNode(9)
root2.right = TreeNode(0)
root2.left?.left = TreeNode(5)
root2.left?.right = TreeNode(1)
sumNumbers(root2) // 1026
