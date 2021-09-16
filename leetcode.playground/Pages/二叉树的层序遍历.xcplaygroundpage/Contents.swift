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
        guard let root = root else { return [] }
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


func levelOrder1(_ root: TreeNode?) -> [Int]? {
    guard let root = root else {
        return nil
    }
    var queue = [TreeNode]()
    queue.append(root)
    var result = [Int]()
    while !queue.isEmpty {
        if let left = queue.first?.left {
            queue.append(left)
        }
        if let right = queue.first?.right {
            queue.append(right)
        }
        if let val = queue.first?.val {
            result.append(val)
            queue.removeFirst()
        }
    }
    return result
}
//print(levelOrder1(node))

func levelOrder2(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    var queue = [TreeNode]()
    queue.append(root)
    var last = 1
    var number = 0
    var result = [[Int]]()
    result.append([])
    while !queue.isEmpty {
        if let left = queue.first?.left {
            number += 1
            queue.append(left)
        }
        if let right = queue.first?.right {
            number += 1
            queue.append(right)
        }
        if let val = queue.first?.val {
            var arrayLast = result.last
            arrayLast?.append(val)
            result.removeLast()
            result.append(arrayLast!)
            queue.removeFirst()
            last -= 1
            if last == 0 {
                last = number
                number = 0
                result.append([])
            }
        }
    }
    result.removeLast()
    return result
}
print(levelOrder2(node))
// 我的解决方法，可能比较好理解，但是官方的更优秀
// 官方的方法在于记录了下一层节点的个数
// 然后统一的进行了出队操作，还不错

// 思考题：可以用递归实现不？
func levelOrder3(_ root: TreeNode?) -> [Int]? {
    guard let root = root else {
        return nil
    }
    var queue = [TreeNode]()
    queue.append(root)
    var result = [Int]()
    while !queue.isEmpty {
        if let left = queue.first?.left {
            queue.append(left)
        }
        if let right = queue.first?.right {
            queue.append(right)
        }
        if let val = queue.first?.val {
            result.append(val)
            queue.removeFirst()
        }
    }
    return result
}
    
