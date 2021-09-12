/**
 给定一个二叉树，检查它是否是镜像对称的。

  

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3     4 4     3
  

 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3
  

 进阶：

 你可以运用递归和迭代两种方法解决这个问题吗？
 */
import Foundation

class Node {
    var value: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ value: Int, _ left: Node? = nil, _ right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}


func isSymmetric(_ root: Node?) -> Bool {
    if root == nil {
        return false
    }
    return test(root?.left, root?.right)
}

func test(_ left: Node?, _ right: Node?) -> Bool {
    // 终止条件
    if left?.value != right?.value {
        return false
    }
    if left == nil && right == nil {
        return true
    }
    return test(left?.left, right?.right) && test(left?.right, right?.left)
}

let node = Node(1, Node(2, Node(3), Node(4)), Node(2, Node(4), Node(4)))
let node1 = Node(1, Node(2, Node(3), Node(4)), Node(2, Node(4), Node(3)))
print(isSymmetric(node), isSymmetric(node1))
