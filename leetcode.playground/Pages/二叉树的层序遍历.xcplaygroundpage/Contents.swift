/**
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
  

 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层序遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
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
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [[]] }
        var result = [[TreeNode]]()
        result.append([root])
        var temp = [Int]()
        while let node = result.last {
            for i in 0 ..< node.count {
                result.append(contentsOf: a)
            }
        }
        return [[]]
    }
}
var solution = Solution()
solution.levelOrder(node)
