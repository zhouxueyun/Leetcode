
import Foundation

/**
 Reorder List
 
 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
 
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 
 Example 1:
 Given 1->2->3->4, reorder it to 1->4->2->3.

 Example 2:
 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
 */

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reorderList(_ head: ListNode?) {
    var count = 0
    var node: ListNode? = head
    while node != nil {
        count += 1
        node = node!.next
    }
    if count <= 2 {
        return
    }
    
    var pre: ListNode? = nil
    var post: ListNode? = nil
    
    node = head
    var index = 0
    while node != nil {
        let next = node!.next
        node!.next = nil
        if index <= count / 2 { // pre
            if pre == nil {
                pre = node
            } else {
                pre!.next = node
                pre = node
            }
        } else { // post
            if post == nil {
                post = node
            } else {
                node!.next = post
                post = node
            }
        }
        index += 1
        node = next
    }
    
    pre = head
    while pre != nil && post != nil {
        let preNext = pre!.next
        let postNext = post!.next
        pre!.next = post
        post!.next = preNext
        pre = preNext
        post = postNext
    }
    
}

func printNode(_ head: ListNode?) {
    var node = head
    while node != nil {
        print(node!.val, terminator: " ")
        node = node!.next
    }
    print()
}

let node11 = ListNode(1)
let node12 = ListNode(2)
let node13 = ListNode(3)
let node14 = ListNode(4)
node11.next = node12; node12.next = node13; node13.next = node14
reorderList(node11)
printNode(node11)

let node21 = ListNode(1)
let node22 = ListNode(2)
let node23 = ListNode(3)
let node24 = ListNode(4)
let node25 = ListNode(5)
node21.next = node22; node22.next = node23; node23.next = node24; node24.next = node25
reorderList(node21)
printNode(node21)


