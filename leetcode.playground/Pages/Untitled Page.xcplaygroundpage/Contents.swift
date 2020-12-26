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
        var temp = head
        var result: ListNode? = nil
        while temp != nil {
            let tempNext = temp?.next
            temp?.next = result
            result = temp
            temp = tempNext
        }
        return result
    }
}

class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let p = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
}

var solution = Solution()
let node1 = ListNode(10, ListNode(20, ListNode(30)))
solution.reverseList(node1)
