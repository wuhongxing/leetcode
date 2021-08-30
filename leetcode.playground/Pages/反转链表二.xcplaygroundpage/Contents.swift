class Node {
    var value: Int = 0
    var next: Node?
    
    init(_ value: Int, _ next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

//func reverse(_ head: Node?) -> Node? {
//    let result = head?.next
//    head?.next?.next = head
//    head?.next = nil
//    return result
//}
//func reverse(_ head: Node?) -> Node? {
//    let result = head?.next?.next
//    head?.next?.next?.next = head?.next
//    head?.next?.next = nil
//    head?.next?.next = head
//    head?.next = nil
//    return result
//}
func reverse(_ head: Node?) -> Node? {
    if head?.next == nil {
        return head
    }
    let result = reverse(head?.next)
    head?.next?.next = head
    head?.next = nil
    print(head?.value, result?.value)
    return result
}
print("======")
//var node1 = Node(1, Node(2))
var node = Node(1, Node(2, Node(3)))
var result = reverse(node)
while result != nil {
    print(result?.value ?? "")
    result = result?.next
}

