//: [Previous](@previous)

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

var node = TreeNode(1, TreeNode(9), TreeNode(10, TreeNode(15), TreeNode(7)))
var node1 = TreeNode(1, TreeNode(9), TreeNode(10, TreeNode(15)))
var node2 = TreeNode(1, TreeNode(9), TreeNode(10, nil, TreeNode(7)))

func maxHeight(_ node: TreeNode?) -> Int {
    guard let node = node else { return 0 }
    return max(maxHeight(node.left), maxHeight(node.right)) + 1
}

func maxHeight1(_ node: TreeNode?) -> Int {
    guard let node = node else { return 0 }
    return process(node, 1)
}

func process(_ node: TreeNode?, _ height: Int) -> Int {
    if node == nil || (node?.left == nil && node?.right == nil) {
        return height
    }
    let leftMax = process(node?.left, height + 1)
    let rightMax = process(node?.right, height + 1)
    return max(leftMax, rightMax)
}
//print(maxHeight(node))
print(maxHeight1(node))
print(maxHeight1(node1))
print(maxHeight1(node2))

func sum(_ max: Int, _ result: Int) -> Int {
    if max == 0 {
        return result
    }
    return sum(max - 1, result + max)
}
//print(sum(100, 0))
