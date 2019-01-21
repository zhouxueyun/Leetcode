
import Foundation

/**
 Binary Tree Right Side View
 
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
 
 Example:
 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 
 Explanation:
    1            <---
  /   \
 2     3         <---
  \     \
  5      4       <---
 */

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func rightSideView(_ root: TreeNode?) -> [Int] {
    var ret = [Int]()
    guard let root = root else {
        return ret
    }
    var arr1 = [TreeNode]()
    arr1.append(root)
    while !arr1.isEmpty {
        ret.append(arr1.last!.val)
        var arr2 = [TreeNode]()
        for node in arr1 {
            if let left = node.left { arr2.append(left) }
            if let right = node.right { arr2.append(right) }
        }
        arr1 = arr2
    }
    
    print(ret)
    return ret
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(2)
root.left?.right = TreeNode(5)
root.left?.right?.left = TreeNode(6)
root.right?.right = TreeNode(4)

rightSideView(root)
