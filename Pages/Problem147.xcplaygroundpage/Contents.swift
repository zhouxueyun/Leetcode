import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func insertionSortList(_ head: ListNode?) -> ListNode? {
    var newHead = head
    var node = head
    while node != nil {
        let next = node!.next
        // 两节点逆序，next节点应该从头寻找位置插入
        if next != nil && next!.val < node!.val {
            // 断开next
            node!.next = next!.next
            // 处理next
            var slowHead: ListNode? = nil
            var fastHead = newHead
            while fastHead != nil {
                // 找到位置插入
                if next!.val < fastHead!.val {
                    next!.next = fastHead
                    if slowHead != nil {
                        slowHead!.next = next
                    } else {
                        newHead = next
                    }
                    break
                }
                slowHead = fastHead
                fastHead = fastHead!.next
            }
        } else {
            node = next
        }
    }
    return newHead
}

func printNode(_ head: ListNode?) {
    var node = head
    while node != nil {
        print(node!.val, terminator: " ")
        node = node!.next
    }
    print()
}

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
printNode(insertionSortList(head1))

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
printNode(insertionSortList(head2))
