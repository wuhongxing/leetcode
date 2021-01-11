/**
 给你二叉树的根节点 root ，返回它节点值的 前序遍历。
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

var node = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
var node1 = TreeNode(1, TreeNode(2), nil)
class Solution {
    var result = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if let val = root?.val {
            result.append(val)
        }
        if let left = root?.left {
            preorderTraversal(left)
        }
        if let right = root?.right {
            preorderTraversal(right)
        }
        return result
    }
}

class Solution1 {
    var result = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        result.append(root.val)
        preorderTraversal(root.left)
        preorderTraversal(root.right)
        return result
    }
}

class Solution2 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil {
            return result
        }
        var stack = [TreeNode]()
        var node = root
        while stack.count != 0 || node != nil {
            while node != nil {
                result.append(node!.val)
                stack.append(node!)
                node = node?.left
            }
            node = stack.popLast()
            node = node?.right
        }
        return result
    }
}

var solution = Solution2()
print(solution.preorderTraversal(node))
