/**
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var stack = [Int]()
        var temp = head
        while temp != nil {
            stack.append(temp!.val)
            temp = temp?.next
        }
        var temp1 = head
        while temp1 != nil {
            if temp1?.val == stack.last {
                stack.removeLast()
            } else {
                return false
            }
            temp1 = temp1?.next
        }
        return true
    }
    
//    func revese(_ head: ListNode?) -> ListNode? {
//        if head == nil || head?.next == nil {
//            return head
//        }
//        let p = revese(head?.next)
//        head?.next?.next = head
//        head?.next = nil
//        return p
//    }
}
var node = ListNode(1, ListNode(2))
var node1 = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
var node2 = ListNode(1, ListNode(1, ListNode(2, ListNode(1))))
var solution = Solution()
print(solution.isPalindrome(node))
print(solution.isPalindrome(node1))
print(solution.isPalindrome(node2))
print(solution.isPalindrome(nil))
