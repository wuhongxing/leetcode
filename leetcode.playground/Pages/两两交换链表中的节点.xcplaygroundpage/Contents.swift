/**
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 输入：head = [1,2,3,4]
 输出：[2,1,4,3]
 示例 2：

 输入：head = []
 输出：[]
 示例 3：

 输入：head = [1]
 输出：[1]
 */

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil{
            return head
        }
        let p = swapPairs(head?.next?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
}

let node1 = ListNode(10, ListNode(20, ListNode(30, ListNode(40))))
var solution = Solution()
var node = solution.swapPairs(node1)
while (node != nil) {
    print(node?.val)
    node = node?.next
}
