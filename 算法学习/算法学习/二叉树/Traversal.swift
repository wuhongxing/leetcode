//
//  Traversal.swift
//  算法学习
//
//  Created by wuhongxing on 2021/7/29.
//

import Foundation

class Traversal {
    func traversal(_ root: TreeNode?) {
        if let root = root {
            print("pre", root.val)
            traversal(root.left)
            print("middle", root.val)
            traversal(root.right)
            print("end", root.val)
        }
//        print("root is nil")
    }
    
    // 用迭代法先序遍历
    func traversal1(_ root: TreeNode?) {
        if let root = root {
            var array = [root]
            while !array.isEmpty {
                if let top = array.last {
                    array.removeLast()
                    print(top.val)
                    if let right = top.right {
                        array.append(right)
                    }
                    if let left = top.left {
                        array.append(left)
                    }
                }
            }
        }
    }
    
    // 后序遍历
    func traversal3(_ root: TreeNode?) {
        if let root = root {
            var array = [TreeNode]()
            array.append(root)
            var result = [TreeNode]()
            while !array.isEmpty {
                if let top = array.last {
                    result.append(top)
                    array.removeLast()
                    if let left = top.left {
                        array.append(left)
                    }
                    if let right = top.right {
                        array.append(right)
                    }
                }
            }
            result.reversed().forEach {
                print($0.val)
            }
        }
    }
    
    // 中序遍历
    // 错误的原因就在于当回退之后，会再次进入左节点
    // 会造成死循环
//    func traversal2(_ root: TreeNode?) {
//        var array = [TreeNode]()
//        if let root = root {
//            array.append(root)
//            while !array.isEmpty {
//                if let last = array.last {
//                    if let left = last.left {
//                        array.append(left)
//                    } else {
//                        print(last.val)
//                        array.removeLast()
//                        if let right = last.right {
//                            array.append(right)
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    // 中序遍历
    func traversal2(_ root: TreeNode?) {
        var current = root
        var array = [TreeNode]()
        while current != nil || !array.isEmpty {
            while current != nil {
                array.append(current!)
                current = current?.left
            }
            current = array.last
            array.removeLast()
            print(current!.val)
            current = current?.right
        }
    }
}
