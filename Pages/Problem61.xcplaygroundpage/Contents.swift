
import Foundation

/**
 Rotate List
 
 Given a linked list, rotate the list to the right by k places, where k is non-negative.
 
 Example 1:
 
 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:
 
 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
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

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil { return nil }
    if k == 0 { return head }
    var len = 0
    var pre: ListNode? = nil
    var tail: ListNode? = head
    while tail != nil {
        pre = tail
        tail = tail?.next
        len += 1
    }
    pre?.next = head // 创建循环链表
    tail = head
    var k = (len - k % len) % len
    while k > 0 {
        pre = tail
        tail = tail?.next
        k -= 1
    }
    pre?.next = nil
    return tail
}

let head1 = ListNode(1)
head1.next = ListNode(2)
head1.next?.next = ListNode(3)
head1.next?.next?.next = ListNode(4)
head1.next?.next?.next?.next = ListNode(5)
printNode(rotateRight(head1, 2))

let head2 = ListNode(0)
head2.next = ListNode(1)
head2.next?.next = ListNode(2)
printNode(rotateRight(head2, 4))
