
import Foundation

/**
 Remove Nth Node From End of List
 
 Given a linked list, remove the n-th node from the end of list and return its head.
 
 Example:
 Given linked list: 1->2->3->4->5, and n = 2.
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 
 Note:
 Given n will always be valid.
 
 Follow up:
 Could you do this in one pass?
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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if head == nil { return nil }
    let dummy = ListNode(0)
    dummy.next = head
    var slow: ListNode? = dummy
    var fast: ListNode? = head
    for _ in 0..<n {
        if fast == nil { return nil }
        fast = fast?.next
    }
    while fast != nil {
        fast = fast?.next
        slow = slow?.next
    }
    slow?.next = slow?.next?.next
    return dummy.next
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)

printNode(head)
printNode(removeNthFromEnd(head, 2))


