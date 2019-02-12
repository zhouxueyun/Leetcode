
import Foundation

/**
 Convert Sorted Array to Binary Search Tree
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example:
 
 Given the sorted array: [-10,-3,0,5,9],
 
 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
 
     0
    / \
  -3   9
  /   /
 -10  5
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

func printTreeNodeInorder(_ root: TreeNode?) {
    inorderPrint(root)
    print()
}

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    return helper(nums, 0, nums.count-1)
}

func helper(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
    if start > end { return nil }
    if start == end { return TreeNode(nums[start]) }
    let mid = start + (end - start) / 2
    let node = TreeNode(nums[mid])
    node.left = helper(nums, start, mid - 1)
    node.right = helper(nums, mid + 1, end)
    return node
}

let root = sortedArrayToBST([-10,-3,0,5,9])
printTreeNodeInorder(root)

