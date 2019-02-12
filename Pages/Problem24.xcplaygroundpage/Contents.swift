
import Foundation

/**
 Swap Nodes in Pairs
 
 Given a linked list, swap every two adjacent nodes and return its head.
 
 Example:
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 
 Note:
 Your algorithm should use only constant extra space.
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 */

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

func swapPairs(_ head: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var node: ListNode? = dummy
    var head = head
    while head != nil && head?.next != nil {
        let next = head?.next
        let nextnext = next?.next
        node?.next = next
        next?.next = head
        head?.next = nextnext
        node = head
        head = nextnext
    }
    return dummy.next
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)

let head1 = ListNode(1)

printNode(swapPairs(head))
printNode(swapPairs(head1))
