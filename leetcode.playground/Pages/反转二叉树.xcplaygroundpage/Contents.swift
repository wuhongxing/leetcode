import Foundation

class Node {
    var value: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ value: Int, _ left: Node? = nil, _ right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

func invertTree(_ head: Node?) -> Node? {
    if head == nil { return nil }
    let temp = head?.left
    head?.left = head?.right
    head?.right = temp
    invertTree(head?.left)
    invertTree(head?.right)
    return head
}

func traversing(_ head: Node?) {
    if head == nil { return }
    print(head?.value)
    traversing(head?.left)
    traversing(head?.right)
}

let node = Node(1, Node(2, Node(4), Node(5)), Node(3))
traversing(node)
print("==============")
reverse(node)
traversing(node)
