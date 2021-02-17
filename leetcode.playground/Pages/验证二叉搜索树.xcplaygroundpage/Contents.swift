/**
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
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

class Solution {
    // 这个解答是错误的，忽略了和父值的比较，只能保证一层是正确的
    // 这个题目不能自底向上，而要自顶向下
    func isValidBST1(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        if let left = root.left, left.val >= root.val {
            return false
        }
        if let right = root.right, right.val <= root.val {
            return false
        }
        
        return isValidBST1(root.left) && isValidBST1(root.right)
    }
    
    // 其实就是把 left & right 和 root 进行比较，然后对 left & right 递归
    func helper(_ root: TreeNode?, lower: Int, upper: Int) -> Bool {
        guard let root = root else { return true }
        if root.val >= upper || root.val <= lower {
            return false
        }
        return helper(root.left, lower: lower, upper: root.val) && helper(root.right, lower: root.val, upper: upper)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, lower: Int.min, upper: Int.max)
    }
}

class Solution1 {
    // 中序遍历非递归
    func isValidBST(_ root: TreeNode?) -> Bool {
        var temp = root
        var stack = [TreeNode]()
        var inorder = Int.min
        while !stack.isEmpty || temp != nil {
            while temp != nil {
                stack.append(temp!)
                temp = temp?.left
            }
            temp = stack.popLast()
            if temp!.val <= inorder {
                return false
            }
            inorder = temp!.val
            temp = temp?.right
        }
        return true
    }
}

class Solution2 {
    var prev: TreeNode?
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        if !isValidBST(root.left) {
            return false
        }
        if let prev = prev, prev.val >= root.val {
            return false
        }
        prev = root
        return isValidBST(root.right)
    }
}

let node = TreeNode(2, TreeNode(1), TreeNode(3))
let node1 = TreeNode(1, TreeNode(2), TreeNode(3))
let node2 = TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6)))
let node3 = TreeNode(5, TreeNode(4), TreeNode(6, TreeNode(3), TreeNode(7)))
let solution = Solution2()
//solution.isValidBST(node)
//solution.isValidBST(node1)
//solution.isValidBST(node2)
solution.isValidBST(node3)
