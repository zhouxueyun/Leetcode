
import Foundation

/**
 Populating Next Right Pointers in Each Node
 
 Given a binary tree
 
 struct TreeLinkNode {
    TreeLinkNode *left;
    TreeLinkNode *right;
    TreeLinkNode *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
 
 Initially, all next pointers are set to NULL.
 
 Note:
 You may only use constant extra space.
 Recursive approach is fine, implicit stack space does not count as extra space for this problem.
 You may assume that it is a perfect binary tree (ie, all leaves are at the same level, and every parent has two children).
 
 Example:
 Given the following perfect binary tree,
     1
    /  \
   2    3
  / \  / \
 4  5  6  7
 
 After calling your function, the tree should look like:
     1 -> NULL
    /  \
   2 -> 3 -> NULL
  / \  / \
 4->5->6->7 -> NULL
 */

class TreeLinkNode {
    public var val: Int
    public var left: TreeLinkNode?
    public var right: TreeLinkNode?
    public var next: TreeLinkNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

func printTreeLinkNode(_ root: TreeLinkNode?) {
    var root = root
    while root != nil {
        var node = root
        while node != nil {
            print(node!.val, terminator: " ")
            node = node?.next
        }
        root = root?.left
        print()
    }
}

func connect(_ root: TreeLinkNode?) {
    guard let root = root else { return }
    if root.left != nil {
        root.left?.next = root.right
        if root.next != nil {
            root.right?.next = root.next?.left
        }
    }
    connect(root.left)
    connect(root.right)
}

let root = TreeLinkNode(1)
root.left = TreeLinkNode(2)
root.right = TreeLinkNode(3)
root.left?.left = TreeLinkNode(4)
root.left?.right = TreeLinkNode(5)
root.right?.left = TreeLinkNode(6)
root.right?.right = TreeLinkNode(7)

connect(root)
printTreeLinkNode(root)

