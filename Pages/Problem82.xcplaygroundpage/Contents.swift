
import Foundation

/**
 Remove Duplicates from Sorted List II
 
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.
 
 Example 1:
 Input: 1->2->3->3->4->4->5
 Output: 1->2->5
 
 Example 2:
 Input: 1->1->1->2->3
 Output: 2->3
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
    if head == nil || head?.next == nil { return head }
    let dummy = ListNode(0)
    var node: ListNode? = dummy
    var slow = head
    var fast = head?.next
    var dupli = false
    while fast != nil {
        if fast!.val == slow!.val {
            dupli = true
        } else {
            if !dupli {
                node?.next = slow
                node = slow
            }
            dupli = false
        }
        slow = fast
        fast = fast?.next
    }
    if !dupli {
        node?.next = slow
        node = slow
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
