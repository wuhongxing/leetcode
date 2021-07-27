//
//  MaxDepth.swift
//  算法学习
//
//  Created by wuhongxing on 2021/7/27.
//

import Foundation

/*
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。
*/


class MaxDepth {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root != nil {
            let left = maxDepth(root?.left)
            let right = maxDepth(root?.right)
            return max(left + 1, right + 1)
        }
        return 0
    }
}
