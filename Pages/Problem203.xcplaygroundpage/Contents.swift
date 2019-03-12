
import Foundation

/**
 Remove Linked List Elements
 
 Remove all elements from a linked list of integers that have value val.
 
 Example:
 Input:  1->2->6->3->4->5->6, val = 6
 Output: 1->2->3->4->5
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(0)
        var pre = dummy
        var node = head
        while node != nil {
            let next = node?.next
            if node!.val != val {
                pre.next = node!
                pre = node!
            }
            node = next
        }
        pre.next = nil
        return dummy.next
    }
}


let node1 = ListNode(1)
node1.next = ListNode(2)
node1.next?.next = ListNode(3)
node1.next?.next?.next = ListNode(4)
node1.next?.next?.next?.next = ListNode(5)
node1.next?.next?.next?.next?.next = ListNode(6)

let s = Solution()
let h = s.removeElements(node1, 6)
printNode(h)
