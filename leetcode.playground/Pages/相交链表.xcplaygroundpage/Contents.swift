
class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var A = headA
        var B = headB
        while true {
            if A === B {
                return A
            }
            A = A?.next
            B = B?.next
            if A == nil && B == nil {
                return nil
            }
            if A == nil {
                A = headB
            }
            if B == nil {
                B = headA
            }
        }
    }
}
