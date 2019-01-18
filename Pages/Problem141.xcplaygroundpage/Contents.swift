//: [Previous](@previous)

import Foundation

/**
 Linked List Cycle
 
 Given a linked list, determine if it has a cycle in it.
 To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.
 
 Example 1:
 Input: head = [3,2,0,-4], pos = 1
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the second node.
 
 Example 2:
 Input: head = [1,2], pos = 0
 Output: true
 Explanation: There is a cycle in the linked list, where tail connects to the first node.
 
 Example 3:
 Input: head = [1], pos = -1
 Output: false
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

func hasCycle(_ head: ListNode?) -> Bool {
    guard head != nil && head!.next != nil else {
        return false
    }
    
    var slow = head
    var fast = head
    
    while fast != nil && fast!.next != nil {
        slow = slow!.next
        fast = fast!.next!.next
        if fast === slow {
            return true
        }
    }
    
    return false
}

let node11 = ListNode(3)
let node12 = ListNode(2)
let node13 = ListNode(0)
let node14 = ListNode(-4)
node11.next = node12; node12.next = node13; node13.next = node14; node14.next = node12
hasCycle(node11)

let node21 = ListNode(1)
let node22 = ListNode(2)
node21.next = node22; node22.next = node21
hasCycle(node21)

let node31 = ListNode(1)
hasCycle(node31)

