/**
 设计链表的实现。您可以选择使用单链表或双链表。单链表中的节点应该具有两个属性：val 和 next。val 是当前节点的值，next 是指向下一个节点的指针/引用。如果要使用双向链表，则还需要一个属性 prev 以指示链表中的上一个节点。假设链表中的所有节点都是 0-index 的。

 在链表类中实现这些功能：

 get(index)：获取链表中第 index 个节点的值。如果索引无效，则返回-1。
 addAtHead(val)：在链表的第一个元素之前添加一个值为 val 的节点。插入后，新节点将成为链表的第一个节点。
 addAtTail(val)：将值为 val 的节点追加到链表的最后一个元素。
 addAtIndex(index,val)：在链表中的第 index 个节点之前添加值为 val  的节点。如果 index 等于链表的长度，则该节点将附加到链表的末尾。如果 index 大于链表长度，则不会插入节点。如果index小于0，则在头部插入节点。
 deleteAtIndex(index)：如果索引 index 有效，则删除链表中的第 index 个节点。

 
 ```
 MyLinkedList linkedList = new MyLinkedList();
 linkedList.addAtHead(1);
 linkedList.addAtTail(3);
 linkedList.addAtIndex(1,2);   //链表变为1-> 2-> 3
 linkedList.get(1);            //返回2
 linkedList.deleteAtIndex(1);  //现在链表是1-> 3
 linkedList.get(1);            //返回3
 ```
 */
class MyLinkedList {
    
    class Node {
        var val: Int = 0
        var next: Node?
        
        init(_ val: Int) {
            self.val = val
        }
    }
    private var head: Node?

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        var i = index
        var temp = head
        while i > 0 {
            i -= 1
            temp = temp?.next
        }
        return temp?.val ?? -1
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let newNode = Node(val)
        newNode.next = head
        head = newNode
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        var temp = head
        let node = Node(val)
        if temp == nil {
            head = node
            return
        }
        while temp?.next != nil {
            temp = temp?.next
        }
        temp?.next = node
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            addAtHead(val)
        }
        let node = Node(val)
        var temp = head
        var pre: Node?
        var last: Node?
        var i = 0
        while temp != nil && pre == nil {
            if i == index - 1 {
                pre = temp
                last = temp?.next
            }
            i += 1
            temp = temp?.next
        }
        pre?.next = node
        node.next = last
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index == 0 {
            head = head?.next
        }
        var pre = head
        var i = 0
        while pre != nil {
            if index - 1 == i {
                if pre?.next?.next == nil {
                    pre?.next = nil
                } else {
                    pre?.next = pre?.next?.next
                }
                return
            }
            i += 1
            pre = pre?.next
        }
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
//[null,null,null,null,2,null,3]
//[null,null,null,null,2,null,2]
let obj = MyLinkedList()
obj.addAtIndex(0, 10)
obj.addAtIndex(0, 20)
obj.addAtIndex(1, 30)
obj.get(0)
//obj.addAtHead(1)
//obj.addAtTail(3)
//obj.addAtIndex(1, 2)
////obj.get(0)
//obj.get(1)
//obj.deleteAtIndex(0)
//obj.get(0)
