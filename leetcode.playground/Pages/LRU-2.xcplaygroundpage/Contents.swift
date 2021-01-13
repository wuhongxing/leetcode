class ListNode {
    var pre: ListNode?
    var next: ListNode?
    var val: Int = 0
    
    init(_ val: Int) {
        self.val = val
    }
}

class LinkedList {
    var head: ListNode? = ListNode(0)
    var tail: ListNode? = ListNode(0)
    // 双向链表的长度
    var count = 0
    
    init() {
        head?.next = tail
        tail?.pre = head
    }
    
    func get(_ val: Int) -> ListNode? {
        var temp = head
        while temp != nil {
            if temp?.val == val {
                return temp
            }
            print(temp?.val)
            temp = temp?.next
        }
        return nil
    }
    
    func add(_ val: Int) {
        let node = ListNode(val)
        tail?.next = node
        node.next = tail
        tail = node
        count += 1
    }
    
    func moveToLast(_ val: Int) {
        let node = get(val)
        node?.pre?.next = node?.next
        node?.next?.pre = node?.pre
        tail?.next = node
        node?.pre = tail
        tail = node
    }
    
    func getFirst() -> Int? {
        return head?.next?.val
    }
     
    func removeFirst() {
        head = head?.next
        count -= 1
    }
}

//var list = LinkedList()
//list.add(10)
//list.add(20)
//list.moveToLast(10)
//print(list.get(10)?.val)
//print(list.get(20)?.val)
//print(list.get(30)?.val)

class LRUCache {
    var list = LinkedList()
    var array = [Int]()
    var dict = [Int: Int]()
    var capacity = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        list.moveToLast(key)
        return dict[key] ?? -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if list.count == capacity {
            if let _ = list.get(key) {
                list.moveToLast(key)
            } else {
                list.removeFirst()
                if let first = list.getFirst() {
                    dict[first] = nil
                }
            }
        } else {
            list.add(key)
        }
        dict[key] = value
    }
}

let cache2 = LRUCache(3)
cache2.put(1, 1)
cache2.put(2, 2)
cache2.put(3, 3)
cache2.put(4, 4)
cache2.get(4)
//cache2.get(3)
//cache2.get(2)
//cache2.get(1)
//cache2.put(5, 5)
//cache2.get(1)
//cache2.get(2)
//cache2.get(3)
//cache2.get(4)
//cache2.get(5)
