/**
 给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。

 请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。

 ```
 输入: 1->2->3->4->5->NULL
 输出: 1->3->5->2->4->NULL
 
 输入: 2->1->3->5->6->4->7->NULL
 输出: 2->3->6->7->1->5->4->NULL
 ```
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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        var odd = head
        let oddHead = odd
        var even = head?.next
        let evenHead = even
        
        while even != nil && even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }
        odd?.next = evenHead
        return oddHead
    }
}

class Solution1 {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        var odd = head
        let oddHead = odd
        var even = head?.next
        let evenHead = even
        
        while even != nil && even?.next != nil {
            odd?.next = odd?.next?.next
            odd = odd?.next
            even?.next = even?.next?.next
            even = even?.next
        }
        odd?.next = evenHead
        return oddHead
    }
}

var solution = Solution()
let node1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
solution.oddEvenList(node1)

