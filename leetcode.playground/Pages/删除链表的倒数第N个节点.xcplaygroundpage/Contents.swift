/**
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 ```
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var p: ListNode? = ListNode(0, head)
        let y = p
        var q = p
        var t = n
        while t >= 0 {
            q = q?.next
            t = t - 1
        }
        while q != nil {
            p = p?.next
            q = q?.next
        }
        p?.next = p?.next?.next
        return y?.next
    }
}

var solution = Solution()
let node1 = ListNode(10, ListNode(20, ListNode(30)))
solution.removeNthFromEnd(node1, 1)
