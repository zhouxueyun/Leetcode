
import Foundation

/**
 Reverse Linked List II
 
 Reverse a linked list from position m to n. Do it in one-pass.
 
 Note: 1 ≤ m ≤ n ≤ length of list.
 
 Example:
 Input: 1->2->3->4->5->NULL, m = 2, n = 4
 Output: 1->4->3->2->5->NULL
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

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var start: ListNode? = nil
    var head: ListNode? = dummy
    for _ in 1...m {
        start = head
        head = head?.next
    }
    var pre: ListNode? = head
    for _ in m...n {
        pre = pre?.next
    }
    for _ in m...n {
        let next = head?.next
        head?.next = pre
        pre = head
        head = next
    }
    start?.next = pre
    return dummy.next
}

let node = ListNode(1)
node.next = ListNode(2)
node.next?.next = ListNode(3)
node.next?.next?.next = ListNode(4)
node.next?.next?.next?.next = ListNode(5)

printNode(node)
printNode(reverseBetween(node, 2, 4))
