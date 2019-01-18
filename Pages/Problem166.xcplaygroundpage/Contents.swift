//: [Previous](@previous)

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    if headA == nil || headB == nil {
        return nil
    }
    var curA = headA
    var curB = headB
    var sizeA = 0
    var sizeB = 0
    while curA != nil {
        sizeA += 1
        curA = curA?.next
    }
    while curB != nil {
        sizeB += 1
        curB = curB?.next
    }
    curA = headA
    curB = headB
    if sizeA > sizeB {
        for _ in 0..<(sizeA-sizeB) { curA = curA?.next }
    }
    if sizeB > sizeA {
        for _ in 0..<(sizeB-sizeA) { curB = curB?.next }
    }
    while curA != nil && curB != nil {
        if curA === curB {
            return curA
        }
        curB = curB?.next
        curA = curA?.next
    }
    return nil
}

//Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
//Output: Reference of the node with value = 8
let nodeA11 = ListNode(4)
let nodeA12 = ListNode(1)
let nodeA13 = ListNode(5)
let nodeB11 = ListNode(0)
let nodeB12 = ListNode(1)
let node11 = ListNode(8)
let node12 = ListNode(4)
let node13 = ListNode(5)

node11.next = node12; node12.next = node13
nodeA11.next = nodeA12; nodeA12.next = nodeA13; nodeA13.next = node11
nodeB11.next = nodeB12; nodeB12.next = node11;
getIntersectionNode(nodeA11, nodeB11)

//Input: intersectVal = 2, listA = [0,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
//Output: Reference of the node with value = 2
let nodeA21 = ListNode(0)
let nodeA22 = ListNode(9)
let nodeA23 = ListNode(1)
let nodeB21 = ListNode(3)
let node21 = ListNode(2)
let node22 = ListNode(4)

node21.next = node22
nodeA21.next = nodeA22; nodeA22.next = nodeA23; nodeA23.next = node21
nodeB21.next = node21
getIntersectionNode(nodeA21, nodeB21)

//Input: intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
//Output: null
let nodeA31 = ListNode(2)
let nodeA32 = ListNode(6)
let nodeA33 = ListNode(4)
let nodeB31 = ListNode(1)
let nodeB32 = ListNode(5)

nodeA31.next = nodeA32; nodeA32.next = nodeA33
nodeB31.next = nodeB32
getIntersectionNode(nodeA31, nodeB31)
