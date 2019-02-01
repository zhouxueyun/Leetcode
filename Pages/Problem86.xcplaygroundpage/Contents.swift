
import Foundation

/**
 Partition List
 
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 Example:
 Input: head = 1->4->3->2->5->2, x = 3
 Output: 1->2->2->4->3->5
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

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    let dummy1 = ListNode(0)
    let dummy2 = ListNode(0)
    var node1: ListNode? = dummy1
    var node2: ListNode? = dummy2
    var node: ListNode? = head
    while node != nil {
        if node!.val < x {
            node1?.next = node
            node1 = node
        } else {
            node2?.next = node
            node2 = node
        }
        node = node?.next
    }
    node1?.next = dummy2.next
    node2?.next = nil
    return dummy1.next
}

//head = 1->4->3->2->5->2, x = 3
let head1 = ListNode(1)
head1.next = ListNode(4)
head1.next?.next = ListNode(3)
head1.next?.next?.next = ListNode(2)
head1.next?.next?.next?.next = ListNode(5)
head1.next?.next?.next?.next?.next = ListNode(2)
printNode(partition(head1, 3))
