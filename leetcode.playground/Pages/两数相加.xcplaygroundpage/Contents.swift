/**
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 ```
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 ```
 */

class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ value: Int = 0, _ next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    // 遍历链表
    func enumerated() {
        var ptr: ListNode? = node1
        while ptr != nil {
            print(ptr?.value)
            ptr = ptr?.next
        }
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        let pre = ListNode(0)
        var cur = pre
        var flag = 0
        while l1 != nil || l2 != nil {
            let x = l1?.value ?? 0
            let y = l2?.value ?? 0
            var sum = x + y + flag
            flag = sum / 10
            sum %= 10
            cur.next = ListNode(sum)
            cur = cur.next!
            if l1 != nil {
                l1 = l1?.next
            }
            if l2 != nil {
                l2 = l2?.next
            }
        }
        if flag == 1 {
            cur.next = ListNode(flag)
        }
        return pre.next
    }
}

var node1 = ListNode(2, ListNode(4, ListNode(3)))
var node2 = ListNode(5, ListNode(6, ListNode(4)))
var solution = Solution()
var node = solution.addTwoNumbers(node1, node2)
//node1.enumerated()
node?.enumerated()
