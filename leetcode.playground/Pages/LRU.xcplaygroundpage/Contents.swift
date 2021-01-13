/**
 设计和构建一个“最近最少使用”缓存，该缓存会删除最近最少使用的项目。缓存应该从键映射到值(允许你插入和检索特定键对应的值)，并在初始化时指定最大容量。当缓存被填满时，它应该删除最近最少使用的项目。

 它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
 
 示例:

 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得密钥 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得密钥 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4
 */

class ListNode {
    var pre: ListNode?
    var next: ListNode?
    var val: Int = 0
    
    init(_ val: Int, _ pre: ListNode? = nil, _ next: ListNode? = nil) {
        self.val = val
        self.pre = pre
        self.next = next
    }
    
    func add(_ val: Int) {
        
    }
    
    func remove(_ val: Int) {
        
    }
     
    func removeLast() {
        
    }
}
class LRUCache {
//    var node: ListNode?
    var array = [Int]()
    var dict = [Int: Int]()
    var capacity = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if let _ = array.firstIndex(of: key) {
            moveToLast(key)
            return dict[key] ?? -1
        }
        return -1
    }
    
    func moveToLast(_ key: Int) {
        if let index = array.firstIndex(of: key) {
            let temp = array[index]
            array.remove(at: index)
            array.append(temp)
//            if index != array.count - 1 {
//                for i in index ..< array.count - 1 {
//                    array[i] = array[i + 1]
//                }
//                array[array.count - 1] = temp
//            }
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let _ = array.firstIndex(of: key) {
            moveToLast(key)
            dict[key] = value
        } else {
            if array.count >= capacity {
                dict.removeValue(forKey: array.first!)
                array.removeFirst()
            }
            array.append(key)
            dict[key] = value
        }
    }
}

//let cache = LRUCache(2)
//cache.put(1, 1)
//cache.put(2, 2)
//cache.get(1)
//cache.put(3, 3)
//cache.get(2)
//cache.put(4, 4)
//cache.get(1)
//cache.get(3)
//cache.get(4)

//let cache = LRUCache(1)
//cache.put(2, 1)
//cache.get(2)
//cache.put(3, 2)
//cache.get(2)
//cache.get(3)

//let cache1 = LRUCache(2)
//cache1.get(2)
//cache1.put(2, 6)
//cache1.get(1)
//cache1.put(1, 5)
//cache1.put(1, 2)
//cache1.get(1)
//cache1.get(2)

let cache2 = LRUCache(3)
cache2.put(1, 1)
cache2.put(2, 2)
cache2.put(3, 3)
cache2.put(4, 4)
cache2.get(4)
cache2.get(3)
cache2.get(2)
cache2.get(1)
cache2.put(5, 5)
cache2.get(1)
cache2.get(2)
cache2.get(3)
cache2.get(4)
cache2.get(5)

