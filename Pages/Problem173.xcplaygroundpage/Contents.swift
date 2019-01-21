
import Foundation


/**
 Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.
 Calling next() will return the next smallest number in the BST.
 
 Note:
 next() and hasNext() should run in average O(1) time and uses O(h) memory, where h is the height of the tree.
 You may assume that next() call will always be valid, that is, there will be at least a next smallest number in the BST when next() is called.
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

class BSTIterator {
    
    var stack = [TreeNode]()
    
    init(_ root: TreeNode?) {
        var node = root
        while node != nil {
            stack.append(node!)
            node = node!.left
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        let next = stack.popLast()!
        if next.right != nil {
            var node = next.right
            while node != nil {
                stack.append(node!)
                node = node!.left
            }
        }
        return next.val
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

let root = TreeNode(7)
root.left = TreeNode(3)
root.right = TreeNode(15)
root.right!.left = TreeNode(9)
root.right!.right = TreeNode(20)

let iterator = BSTIterator(root);
iterator.next();    // return 3
iterator.next();    // return 7
iterator.hasNext(); // return true
iterator.next();    // return 9
iterator.hasNext(); // return true
iterator.next();    // return 15
iterator.hasNext(); // return true
iterator.next();    // return 20
iterator.hasNext(); // return false

