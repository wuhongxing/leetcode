/**
 给你两棵二叉树的根节点 p 和 q ，编写一个函数来检验这两棵树是否相同。

 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 */
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
var node1 = TreeNode(1, TreeNode(9), TreeNode(10, TreeNode(15), TreeNode(7)))
var node2 = TreeNode(1, TreeNode(9), TreeNode(10, TreeNode(15), TreeNode(8)))

class Solution {
    // 这个就是深度优先
    // 后面还有一个广度优先需要学
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p == nil || q == nil {
            return false
        } else if (p?.val != q?.val) {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
var solution = Solution()
//solution.isSameTree(node, node1)
print(solution.isSameTree(node, node2))
