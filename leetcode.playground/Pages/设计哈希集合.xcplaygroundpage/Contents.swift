/**
 哈希表 是一种使用 哈希函数 组织数据，以支持快速插入和搜索的数据结构。

 有两种不同类型的哈希表：哈希集合和哈希映射。

 哈希集合 是 集合 的实现方式之一，用于存储 非重复值。
 哈希映射 是 映射 的实现之一，用于存储 (key, value) 键值对。
 在 标准模板库 的帮助下，哈希表是 易于使用的。大多数常见语言（如 Java，C ++ 和 Python）都支持哈希集合和哈希映射。

 通过选择合适的哈希函数，哈希表可以在插入和搜索方面展现出 出色的性能。

 在本 LeetBook 中，我们将回答以下问题：

 哈希表的 原理 是什么？
 如何 设计 哈希表？如何解决 哈希冲突？
 如何使用 哈希集合 解决与重复元素相关的问题？
 如何使用 哈希映射 解决与滑动窗口相关的问题？
 如何在使用哈希表时设计正确的键？
 */

class MyHashSet {
    var array = [Int](repeating: -1, count: 1000000)
    /** Initialize your data structure here. */
    init() {
        
    }
    
    func add(_ key: Int) {
        array[key] = key
    }
    
    func remove(_ key: Int) {
        array[key] = -1
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        return array[key] != -1
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
let obj = MyHashSet()
obj.add(1)
obj.add(2)
obj.contains(1)
obj.contains(3)
obj.add(2)
obj.contains(2)
obj.remove(2)
obj.contains(2)
