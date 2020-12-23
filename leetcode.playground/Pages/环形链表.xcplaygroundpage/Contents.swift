/**
 给定一个链表，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 如果链表中存在环，则返回 true 。 否则，返回 false 。
 */

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int, _ next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
}

extension ListNode: Hashable {
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val
    }
    
    func hash(into hasher: inout Hasher) {
        
    }
}

/// 使用快慢两个指针，如果两个指针碰到了，那么肯定就是有环
/// 时间复杂度 O(n)，空间复杂度 O(1)
class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var ptr1 = head
        var ptr2 = head
        while (ptr1 != nil) {
            ptr1 = ptr1?.next
            ptr2 = ptr2?.next?.next
            if ptr1 === ptr2 && ptr2 != nil {
                return true
            }
        }
        return false
    }
}

/// 使用 Hash 表
class Solution1 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var set = Set<ListNode>()
        var ptr = head
        while ptr != nil {
            if set.contains(ptr!) {
                return true
            }
            set.insert(ptr!)
            ptr = ptr?.next
        }
        return false
    }
}

// 别看只是改成一次跳两步，平均执行时间缩短了很多，当然时间复杂度还是不变的
class Solution2 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var ptr1 = head
        var ptr2 = head
        while (ptr2 != nil) {
            ptr1 = ptr1?.next
            ptr2 = ptr2?.next?.next
            if ptr1 === ptr2 && ptr2 != nil {
                return true
            }
        }
        return false
    }
}

var solution = Solution2()
let node1 = ListNode(10, ListNode(20, ListNode(30)))
let node2 = ListNode(10, ListNode(20, ListNode(30)))
node1.next = node2
node2.next = node1
solution.hasCycle(node1)
