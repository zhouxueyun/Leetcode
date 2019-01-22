
import Foundation

/**
 Merge Two Sorted Lists
 
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
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
        print(node!.val, terminator: " ")
        node = node?.next
    }
    print()
}

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var node: ListNode? = dummy
    var head1 = l1
    var head2 = l2
    while head1 != nil && head2 != nil {
        if head1!.val <= head2!.val {
            node?.next = head1
            head1 = head1?.next
        } else {
            node?.next = head2
            head2 = head2?.next
        }
        node = node?.next
    }
    if head1 != nil {
        node?.next = head1
    }
    if head2 != nil {
        node?.next = head2
    }
    return dummy.next
}

let head1 = ListNode(1)
head1.next = ListNode(2)
head1.next?.next = ListNode(4)
head1.next?.next?.next = ListNode(5)

let head2 = ListNode(1)
head2.next = ListNode(3)
head2.next?.next = ListNode(4)

printNode(mergeTwoLists(head1, head2))
