/**
 删除链表中等于给定值 val 的所有节点。
 
 ```
 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var temp = head
        var last = temp
        var tempHead = temp
        while temp != nil {
            if temp?.val == val {
                if last === temp {
                    temp = temp?.next
                    last = temp
                    tempHead = temp
                } else {
                    last?.next = last?.next?.next
                    temp = temp?.next
                }
            } else {
                last = temp
                temp = temp?.next
            }
        }
        return tempHead
    }
}

var solution = Solution()
//let node1 = ListNode(10, ListNode(20, ListNode(30)))
//solution.removeElements(node1, 20)
//let node2 = ListNode(1)
//solution.removeElements(node2, 1)
let node3 = ListNode(1, ListNode(1))
solution.removeElements(node3, 1)
