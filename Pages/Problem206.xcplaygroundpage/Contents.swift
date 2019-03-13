
import Foundation

/**
 Reverse Linked List
 
 Reverse a singly linked list.
 
 Example:
 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 
 Follow up:
 A linked list can be reversed either iteratively or recursively. Could you implement both?
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

class Solution {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        var pre: ListNode? = nil
//        var curr: ListNode? = head
//
//        while curr != nil {
//            let next = curr?.next
//            curr?.next = pre
//            pre = curr
//            curr = next
//        }
//
//        return pre
//    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        let newH = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newH
    }
}

let node1 = ListNode(1)
node1.next = ListNode(2)
node1.next?.next = ListNode(3)
node1.next?.next?.next = ListNode(4)
node1.next?.next?.next?.next = ListNode(5)

let s = Solution()
printNode(s.reverseList(node1))
