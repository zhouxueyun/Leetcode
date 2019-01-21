//: [Previous](@previous)

import Foundation

/**
 Add Two Numbers
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var node = dummy
    
    var c = 0
    var node1 = l1
    var node2 = l2
    
    while node1 != nil && node2 != nil {
        let val = node1!.val + node2!.val + c
        node.next = ListNode(val % 10)
        c = val / 10
        node1 = node1?.next
        node2 = node2?.next
        node = node.next!
    }
    
    while node1 != nil {
        let val = node1!.val + c
        node.next = ListNode(val % 10)
        c = val / 10
        node1 = node1?.next
        node = node.next!
    }
    
    while node2 != nil {
        let val = node2!.val + c
        node.next = ListNode(val % 10)
        c = val / 10
        node2 = node2?.next
        node = node.next!
    }
    
    if c > 0 {
        node.next = ListNode(c)
    }
    
    return dummy.next
}

func printNode(_ node: ListNode?) {
    var node = node
    while node != nil {
        print(node!.val, terminator: " ")
        node = node?.next
    }
    print()
}

let node1 = ListNode(2)
node1.next = ListNode(4)
node1.next?.next = ListNode(3)

let node2 = ListNode(5)
node2.next = ListNode(6)
node2.next?.next = ListNode(4)

printNode(addTwoNumbers(node1, node2))
