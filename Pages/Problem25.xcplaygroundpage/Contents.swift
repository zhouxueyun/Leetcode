
import Foundation

/**
 Reverse Nodes in k-Group
 
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
 
 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
 
 Example:
 Given this linked list: 1->2->3->4->5
 For k = 2, you should return: 2->1->4->3->5
 For k = 3, you should return: 3->2->1->4->5
 
 Note:
 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
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

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil || k <= 1 { return head }
    let dummy = ListNode(0)
    dummy.next = head
    var pre: ListNode? = dummy
    var cur: ListNode? = head
    var i = 0
    while cur != nil {
        i += 1
        let next = cur?.next
        if i % k == 0 {
            pre = reverseOneGroup(pre, next)
        }
        cur = next
    }
    return dummy.next
}

func reverseOneGroup(_ pre: ListNode?, _ post: ListNode?) -> ListNode? {
    // before: pre -> ( 1 -> 2 -> 3 ) -> post
    // after: pre -> ( 3 -> 2 -> 1 ) -> post
    let last = pre?.next
    var cur = last?.next
    while cur !== post {
        let next = cur?.next
        last?.next = next
        cur?.next = pre?.next
        pre?.next = cur
        cur = next
    }
    return last
}

var head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)
printNode(reverseKGroup(head, 2))

head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)
printNode(reverseKGroup(head, 3))

head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)
printNode(reverseKGroup(head, 4))
