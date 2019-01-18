
import Foundation

/**
 LRU Cache
 
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 
 Follow up:
 Could you do both operations in O(1) time complexity?
 */

class LRUCache {
    class ListNode {
        var key: Int
        var value: Int
        var pre: ListNode?
        var next: ListNode?
        init(key: Int, value: Int) {
            self.key = key
            self.value = value
            self.pre = nil
            self.next = nil
        }
    }
    
    var capacity: Int
    
    var head: ListNode?
    var tail: ListNode?
    var caches: [Int: ListNode]
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.caches = [Int: ListNode]()
    }
    
    func get(_ key: Int) -> Int {
        if let node = caches[key] {
            removeNode(node)
            setHeadNode(node)
            return node.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = caches[key] { // 原有
            node.value = value
            removeNode(node)
            setHeadNode(node)
        } else { // 原来没有，新增节点
            if caches.count >= capacity {
                caches.removeValue(forKey: tail!.key)
                removeNode(tail!)
            }
            let node = ListNode(key: key, value: value)
            caches[key] = node
            setHeadNode(node)
        }
    }
    
    private func setHeadNode(_ node: ListNode) {
        if head != nil {
            node.next = head
            head!.pre = node
        } else {
            tail = node
        }
        head = node
    }
    
    private func removeNode(_ node: ListNode) {
        let pre = node.pre
        let next = node.next
        
        if pre != nil {
            pre!.next = next
        } else { // 是头节点
            head = next
        }
        
        if next != nil {
            next!.pre = pre
        } else { // 是尾节点
            tail = pre
        }
        
        node.pre = nil
        node.next = nil
    }
    
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

let cache = LRUCache(2);

cache.put(1, 1);
cache.put(2, 2);
cache.get(1);       // returns 1
cache.put(3, 3);    // evicts key 2
cache.get(2);       // returns -1 (not found)
cache.put(4, 4);    // evicts key 1
cache.get(1);       // returns -1 (not found)
cache.get(3);       // returns 3
cache.get(4);       // returns 4
