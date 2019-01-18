
import Foundation

/**
 Linked List Cycle II
 
 Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.
 
 Note: Do not modify the linked list.
 
 Example 1:
 Input: head = [3,2,0,-4], pos = 1
 Output: tail connects to node index 1
 Explanation: There is a cycle in the linked list, where tail connects to the second node.
 
 Example 2:
 Input: head = [1,2], pos = 0
 Output: tail connects to node index 0
 Explanation: There is a cycle in the linked list, where tail connects to the first node.
 
 Example 3:
 Input: head = [1], pos = -1
 Output: no cycle
 Explanation: There is no cycle in the linked list.
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func detectCycle(_ head: ListNode?) -> ListNode? {
    guard head != nil && head!.next != nil else {
        return nil
    }
    var slow = head
    var fast = head
    while fast != nil && fast!.next != nil {
        slow = slow!.next;
        fast = fast!.next!.next;
        if slow === fast {  //说明有环
            break;
        }
    }
    // 无环
    if fast == nil || fast!.next == nil {
        return nil
    }
    //有环，求环的起始节点
    fast = head;
    while fast !== slow {
        fast = fast!.next;
        slow = slow!.next;
    }
    return fast
}

let node11 = ListNode(3)
let node12 = ListNode(2)
let node13 = ListNode(0)
let node14 = ListNode(-4)
node11.next = node12; node12.next = node13; node13.next = node14; node14.next = node12
detectCycle(node11)

let node21 = ListNode(1)
let node22 = ListNode(2)
node21.next = node22; node22.next = node21
detectCycle(node21)

let node31 = ListNode(1)
detectCycle(node31)


