//
//  FindTreeNode.swift
//  算法学习
//
//  Created by wuhongxing on 2021/8/26.
//

import Foundation

class TreeNode1 {
    var value: Int = 0
    var left: TreeNode1?
    var right: TreeNode1?
    var parent: TreeNode1?
    
    init(_ value: Int) {
        self.value = value
    }
}

func pre(node: TreeNode1?) -> TreeNode1? {
    guard let node = node else {
        return nil
    }
    if let right = node.right {
        var temp = right
        while let left = temp.left {
            temp = left
        }
        return temp
    }
    var temp = node
    var parent = temp.parent
    while parent != nil && parent?.left !== temp {
        temp = parent!
        parent = temp.parent
    }
    return parent
}

func preTest() {
    let node1 = TreeNode1(1)
    let node2 = TreeNode1(2)
    let node3 = TreeNode1(3)
    let node4 = TreeNode1(4)
    let node5 = TreeNode1(5)
    let node6 = TreeNode1(6)
    let node7 = TreeNode1(7)
    
    node1.left = node2
    node1.right = node3
    node2.parent = node1
    node3.parent = node1
    
    node2.left = node4
    node2.right = node5
    node4.parent = node2
    node5.parent = node2
    
    node3.left = node6
    node3.right = node7
    node6.parent = node3
    node7.parent = node3
    
    traversal(node1)
    
    print("后序结点：", pre(node: node1)?.value)
    print("后序结点：", pre(node: node2)?.value)
    print("后序结点：", pre(node: node3)?.value)
    print("后序结点：", pre(node: node7)?.value)
}
