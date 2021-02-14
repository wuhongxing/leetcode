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
        guard var root = root else { return [] }
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        var curretNum = 1
        while !queue.isEmpty {
            print(queue.count)
            var temp = [Int]()
            var nextNum = 0
            for _ in 0 ..< curretNum {
                if let val = queue.first?.val {
                    temp.append(val)
                }
                if let left = queue.first?.left {
                    queue.append(left)
                    nextNum += 1
                }
                if let right = queue.first?.right {
                    queue.append(right)
                    nextNum += 1
                }
                queue.removeFirst()
            }
            result.append(temp)
            curretNum = nextNum
        }
        return result
    }
}
var solution = Solution()
solution.levelOrder(node)
