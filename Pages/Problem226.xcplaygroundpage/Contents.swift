
import Foundation

/**
 Invert Binary Tree
 
 Invert a binary tree.
 
 Example:
 
 Input:
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 Output:
      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 
 Trivia:
 This problem was inspired by this original tweet by Max Howell:
 
 Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
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
    
    func levelPrint() {
        var queue = [TreeNode?]()
        queue.append(self)
        while !queue.filter({ $0 != nil }).isEmpty {
            var newQueue = [TreeNode?]()
            for n in queue {
                print(n == nil ? "nil" : String(n!.val), terminator: " ")
                newQueue.append(n?.left)
                newQueue.append(n?.right)
            }
            queue = newQueue
            print()
        }
    }
}

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        let tmp = invertTree(root?.left)
        root?.left = invertTree(root?.right)
        root?.right = tmp
        return root
    }
}

let left = TreeNode(2)
left.left = TreeNode(1)
left.right = TreeNode(3)

let right = TreeNode(7)
right.left = TreeNode(6)
right.right = TreeNode(9)

let root = TreeNode(4)
root.left = left
root.right = right
root.levelPrint()

let s = Solution()
let rst = s.invertTree(root)
rst?.levelPrint()

