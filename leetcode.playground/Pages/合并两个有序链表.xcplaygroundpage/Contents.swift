/**
 将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 ```
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 ```
 */

class ListNode {
    var pre: ListNode?
    var next: ListNode?
    
    var val: Int = 0
    
    init(_ val: Int, _ next: ListNode? = nil, _ pre: ListNode? = nil) {
        self.val = val
        self.pre = pre
        self.next = next
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result: ListNode? = ListNode(-1)
        let head = result
        var temp1 = l1
        var temp2 = l2
        while temp1 != nil && temp2 != nil {
            if temp1!.val <= temp2!.val {
                result?.next = temp1
                temp1 = temp1?.next
            } else {
                result?.next = temp2
                temp2 = temp2?.next
            }
            result = result?.next
        }
        result?.next = temp1 == nil ? temp2 : temp1
        return head?.next
    }
}

class Solution1 {
    var temp1: ListNode?
    var temp2: ListNode?
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        temp1 = l1
        temp2 = l2
        if temp1 == nil {
            return temp2
        }
        if temp2 == nil {
            return temp1
        }
        if temp1!.val < temp2!.val {
            temp1?.next = mergeTwoLists(temp1?.next, temp2)
            return l1
        } else {
            temp2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}

var solution = Solution1()
var l1 = ListNode(1, ListNode(2, ListNode(4)))
var l2 = ListNode(1, ListNode(3, ListNode(4)))
solution.mergeTwoLists(l1, l2)
