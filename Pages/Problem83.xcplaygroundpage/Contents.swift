
import Foundation

/**
 Remove Duplicates from Sorted List
 
 Given a sorted linked list, delete all duplicates such that each element appear only once.
 
 Example 1:
 Input: 1->1->2
 Output: 1->2
 
 Example 2:
 Input: 1->1->2->3->3
 Output: 1->2->3
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func printNode(_ head: ListNode?) {
    var node = head
    while node != nil {
        print("->", node!.val, terminator: " ")
        node = node?.next
    }
    print()
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    if head == nil { return nil }
    let dummy = ListNode(Int.min)
    var node: ListNode? = dummy
    var curr: ListNode? = head
    while curr != nil {
        if curr!.val != node!.val {
            node?.next = curr
            node = curr
        }
        curr = curr?.next
    }
    node?.next = nil
    return dummy.next
}

//1->2->3->3->4->4->5
let head1 = ListNode(1)
head1.next = ListNode(2)
head1.next?.next = ListNode(3)
head1.next?.next?.next = ListNode(3)
head1.next?.next?.next?.next = ListNode(4)
head1.next?.next?.next?.next?.next = ListNode(4)
head1.next?.next?.next?.next?.next?.next = ListNode(5)
printNode(deleteDuplicates(head1))

//1->1->1->2->3
let head2 = ListNode(1)
head2.next = ListNode(1)
head2.next?.next = ListNode(1)
head2.next?.next?.next = ListNode(2)
head2.next?.next?.next?.next = ListNode(3)
printNode(deleteDuplicates(head2))
