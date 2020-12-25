
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

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var set = Set<ListNode>()
        var temp = head
        while temp != nil {
            if set.contains(temp!) {
                return temp
            }
            set.insert(temp!)
            temp = temp?.next
        }
        return nil
    }
}

class Solution1 {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                var ptr = head
                while ptr !== slow {
                    ptr = ptr?.next
                    slow = slow?.next
                }
                return ptr
            }
        }
        return nil
    }
}


var solution = Solution()
let node1 = ListNode(10, ListNode(20, ListNode(30)))
let node2 = ListNode(10, ListNode(20, ListNode(30)))
node1.next = node2
node2.next = node1
solution.detectCycle(node1)

