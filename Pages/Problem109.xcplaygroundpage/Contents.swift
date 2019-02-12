
import Foundation

/**
 Convert Sorted List to Binary Search Tree
 
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example:
 
 Given the sorted linked list: [-10,-3,0,5,9],
 
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

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func printNode(_ node: ListNode?) {
    var node = node
    while node != nil {
        print(node!.val, terminator: "->")
        node = node?.next
    }
    print()
}

func sortedListToBST(_ head: ListNode?) -> TreeNode? {
    return helper(head, nil)
}

func helper(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
    if head === tail { return nil }
    var slow = head // mid
    var fast = head
    while fast !== tail && fast?.next !== tail {
        slow = slow?.next
        fast = fast?.next?.next
    }
    let node = TreeNode(slow!.val)
    node.left = helper(head, slow)
    node.right = helper(slow?.next, tail)
    return node
}

let head = ListNode(-10)
head.next = ListNode(-3)
head.next?.next = ListNode(0)
head.next?.next?.next = ListNode(5)
head.next?.next?.next?.next = ListNode(9)
printNode(head)

let root = sortedListToBST(head)
printTreeNodeInorder(root)
