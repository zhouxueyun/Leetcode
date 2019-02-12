
import Foundation

/**
 Unique Binary Search Trees II
 
 Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.
 
 Example:
 
 Input: 3
 Output:
 [
    [1,null,3,2],
    [3,2,null,1],
    [3,1,null,null,2],
    [2,1,3],
    [1,null,2,null,3]
 ]
 Explanation:
 The above output corresponds to the 5 unique BST's shown below:
 
 1         3     3      2      1
  \       /     /      / \      \
   3     2     1      1   3      2
  /     /       \                 \
 2     1         2                 3
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

func generateTrees(_ n: Int) -> [TreeNode?] {
    if n < 1 { return [] }
    return helper(1, n)
}

func helper(_ start: Int, _ end: Int) -> [TreeNode?] {
    if start > end { return [nil] }
    if start == end { return [TreeNode(start)] }
    var ret = [TreeNode?]()
    for i in start...end {
        let leftRoots = helper(start, i-1)
        let rightRoots = helper(i+1, end)
        for left in leftRoots {
            for right in rightRoots {
                let root = TreeNode(i)
                root.left = left
                root.right = right
                ret.append(root)
            }
        }
    }
    return ret
}

let roots = generateTrees(3)
for r in roots {
    printTreeNode(r)
}

