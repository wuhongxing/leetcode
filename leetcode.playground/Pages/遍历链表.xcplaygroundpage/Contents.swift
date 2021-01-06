class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}


class Solution {
    // 正序遍历
    func blLink(_ head: ListNode?) {
        print(head?.val)
        if head?.next != nil {
            blLink(head?.next)
        }
    }
    
    func rblLink(_ head: ListNode?) {
        if head?.next != nil {
            rblLink(head?.next)
        }
        print(head?.val)
    }
    
    func copyLink(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let p = copyLink(head?.next)
        return p
    }
}
let node1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

var sol = Solution()
//sol.blLink(node1)
//sol.rblLink(node1)
var r = sol.copyLink(node1)
print(r)
print(node1)
