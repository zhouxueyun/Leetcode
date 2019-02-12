
import Foundation

/**
 Merge k Sorted Lists
 
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 
 Example:
 
 Input:
 [
    1->4->5,
    1->3->4,
    2->6
 ]
 Output: 1->1->2->3->4->4->5->6
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

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var node: ListNode? = dummy
    var head1 = l1
    var head2 = l2
    while head1 != nil && head2 != nil {
        if head1!.val <= head2!.val {
            node?.next = head1
            head1 = head1?.next
        } else {
            node?.next = head2
            head2 = head2?.next
        }
        node = node?.next
    }
    if head1 != nil {
        node?.next = head1
    }
    if head2 != nil {
        node?.next = head2
    }
    return dummy.next
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.isEmpty { return nil }
    var lists = lists
    var count = lists.count
    while count > 1 {
        var start = 0
        var end = count - 1
        while start < end { // 两两合并即可
            lists[start] = mergeTwoLists(lists[start], lists[end])
            start += 1
            end -= 1
        }
        count = (count + 1) / 2
    }
    return lists[0]
}

let head1 = ListNode(1)
head1.next = ListNode(4)
head1.next?.next = ListNode(5)

let head2 = ListNode(1)
head2.next = ListNode(3)
head2.next?.next = ListNode(4)

let head3 = ListNode(2)
head3.next = ListNode(6)

printNode(mergeKLists([head1, head2, head3]))
