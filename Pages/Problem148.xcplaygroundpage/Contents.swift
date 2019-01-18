import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func sortList(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    var size = 0
    var node: ListNode? = head
    while node != nil {
        node = node?.next
        size += 1
    }
    return sortList(head, size)
}

func sortList(_ head: ListNode?, _ size: Int) -> ListNode? {
    guard size > 1 else {
        head?.next = nil
        return head
    }
    var pivot = head
    for _ in 0 ..< size / 2 {
        pivot = pivot?.next
    }
    
    var left = sortList(head, size / 2)
    var right = sortList(pivot, size - size / 2)
    
    let dummy = ListNode(0)
    var cur = dummy
    
    while left != nil && right != nil {
        if left!.val < right!.val {
            cur.next = left
            left = left!.next
        } else {
            cur.next = right
            right = right!.next
        }
        cur = cur.next!
    }
    while left != nil {
        cur.next = left
        left = left!.next
        cur = cur.next!
    }
    while right != nil {
        cur.next = right
        right = right!.next
        cur = cur.next!
    }
    return dummy.next
}

func printNode(_ head: ListNode?) {
    var node = head
    while node != nil {
        print(node!.val, terminator: " ")
        node = node!.next
    }
    print()
}

//let node = ListNode(1)
//node.next = ListNode(2)
//print(getMiddle(node)?.val)

// test 1
let node11 = ListNode(4)
let node12 = ListNode(2)
let node13 = ListNode(1)
let node14 = ListNode(3)

let head1 = node11
node11.next = node12
node12.next = node13
node13.next = node14

printNode(head1)
printNode(sortList(head1))

// test 2
let node21 = ListNode(-1)
let node22 = ListNode(5)
let node23 = ListNode(3)
let node24 = ListNode(4)
let node25 = ListNode(0)

let head2 = node21
node21.next = node22
node22.next = node23
node23.next = node24
node24.next = node25

printNode(head2)
printNode(sortList(head2))
