
import UIKit

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

func preOrderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    print(node.val, terminator: " ")
    preOrderPrint(node.left)
    preOrderPrint(node.right)
}

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return [Int]()
    }
    
    var ret = [Int]()
    
    var stack = [TreeNode]()
    stack.append(root)
    
    while !stack.isEmpty {
        let node = stack.popLast()!
        ret.append(node.val)
        
        // push the right
        if let right = node.right {
            stack.append(right)
        }
        
        // push the left
        if let left = node.left {
            stack.append(left)
        }
    }
    
    return ret
}

func inOrderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    inOrderPrint(node.left)
    print(node.val, terminator: " ")
    inOrderPrint(node.right)
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return [Int]()
    }
    
    var ret = [Int]()
    
    var stack = [TreeNode]()
    stack.append(root)
    
    var flag = true // 是否为新添加进的右节点
    while !stack.isEmpty {
        // 处理左子树
        if flag {
            while stack.last!.left != nil {
                stack.append(stack.last!.left!)
            }
        }
        // 处理根节点
        let node = stack.popLast()!
        ret.append(node.val)
        // 处理右子树
        if let right = node.right {
            stack.append(right)
            flag = true
        } else {
            flag = false
        }
    }
    
    return ret
}

func inorderTraversal1(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return [Int]()
    }
    
    var ret = [Int]()
    
    var stack = [TreeNode]()
    stack.append(root)
    
    var flags = [Bool]() // 是否为新添加的根节点
    flags.append(true)
    
    while !stack.isEmpty {
        var flag = flags.popLast()!
        var node = stack.popLast()!
        if flag {
            if let right = node.right {
                stack.append(right)
                flags.append(true)
            }
            stack.append(node)
            flags.append(false)
            if let left = node.left {
                stack.append(left)
                flags.append(true)
            }
        } else {
            ret.append(node.val)
        }
    }
    
    return ret
}

func postOrderPrint(_ node: TreeNode?) {
    guard let node = node else {
        return
    }
    postOrderPrint(node.left)
    postOrderPrint(node.right)
    print(node.val, terminator: " ")
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return [Int]()
    }
    
    var ret = [Int]()
    
    var stack = [TreeNode]()
    stack.append(root)
    
    var flags = [Bool]() // 是否为新添加的根节点
    flags.append(true)
    
    while !stack.isEmpty {
        var flag = flags.popLast()!
        var node = stack.popLast()!
        if flag {
            stack.append(node)
            flags.append(false)
            if let right = node.right {
                stack.append(right)
                flags.append(true)
            }
            if let left = node.left {
                stack.append(left)
                flags.append(true)
            }
        } else {
            ret.append(node.val)
        }
    }
    
    return ret
}

let left = TreeNode(2)
//left.left = TreeNode(4)
left.right = TreeNode(5)

let right = TreeNode(3)
right.left = TreeNode(6)
//right.right = TreeNode(7)

let root = TreeNode(1)
root.left = left
root.right = right

preorderTraversal(root)
preOrderPrint(root)
print()

inorderTraversal(root)
inorderTraversal1(root)
inOrderPrint(root)
print()

postorderTraversal(root)
postOrderPrint(root)
print()


