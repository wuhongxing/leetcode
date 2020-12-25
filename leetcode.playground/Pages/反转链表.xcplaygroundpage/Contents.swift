/**
 反转一个单链表。
 
 ```
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var node = head
        while head != nil {
            node = node?.next
        }
        return nil
    }
}
var list = ListNode(10, ListNode(20, ListNode(30, ListNode(40))))
var solution = Solution()
solution.reverseList(list)
