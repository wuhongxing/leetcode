/**
 请判断一个链表是否为回文链表。
 
 ```
 输入: 1->2
 输出: false
 
 输入: 1->2->2->1
 输出: true
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        
        return false
    }
}

var solution = Solution()
let node1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
solution.isPalindrome(node1)
