
import Foundation

/**
 Copy List with Random Pointer
 
 A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.
 
 Return a deep copy of the list.
 */

class RandomListNode {
    var label: Int
    var next: RandomListNode?
    var random: RandomListNode?
    init(_ x: Int) {
        self.label = x
        self.next = nil
        self.random = nil
    }
}

func copyRandomList(_ head: RandomListNode?) -> RandomListNode? {
    if head == nil {
        return nil;
    }
    // 1、copy the node
    var h1 = head
    while h1 != nil {
        let tmp = RandomListNode(h1!.label)
        tmp.next = h1!.next
        tmp.random = h1!.random
        h1!.next = tmp
        h1 = tmp.next
    }
    // 2、copy the random
    var h2 = head
    while h2 != nil {
        if h2!.random != nil {
            h2!.next!.random = h2!.random!.next
        }
        h2 = h2!.next!.next
    }
    // 3、separate the node
    let ret = head!.next;
    var h3 = head
    var r3 = ret
    while h3 != nil {
        h3!.next = r3!.next
        if h3!.next != nil {
            r3!.next = h3!.next!.next
        }
        h3 = h3!.next
        r3 = r3!.next
    }
    return ret;
}
