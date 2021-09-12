/**
 堆：用数组实现的二叉树
 
 常用方法：
 构建优先队列
 支持堆排序
 快速找出一个集合中的最小值
 在朋友面前装逼
 
 和二叉搜索树的区别：
 节点的顺序：只要求比子节点大（小）。二叉搜索树必须左比父小，右比父大
 内存占用：没有左右指针，仅需存储数组
 平衡：二叉搜索树必须平衡，大部分的操作才能达到logn。
 搜索：二叉搜索树很快，堆中很慢。因为搜索并非第一优先级，因为使用堆的目的是将最大的节点放到最前面，从而快速的进行相关插入、删除操作。
 
 可以使用普通树来模拟堆，但那是对空间极大的浪费。
 */
import Foundation
var array = [10, 7, 3, 8, 9, 9, 5, 10, 7, 3, 8, 9, 9, 5, 2]
/*
 parent(i) = floor((i - 1) / 2)
 left(i) = 2i + 1
 right(i) = 2i + 2
 */
func resize(array: inout [Int]) {
    for i in (0 ..< array.count).reversed() {
        let parent = Int(floor(Double((i - 1) / 2)))
        let left = 2 * i + 1
        let right = 2 * i + 2
        if array[parent] < array[i] {
            exchange(&array, parent, with: i)
        }
        if left < array.count && array[i] < array[left] {
            exchange(&array, i, with: left)
        }
        if right < array.count && array[i] < array[right] {
            exchange(&array, i, with: right)
        }
    }
}

func exchange(_ array: inout [Int], _ index: Int, with otherIndex: Int) {
    let temp = array[index]
    array[index] = array[otherIndex]
    array[otherIndex] = temp
}

//resize(array: &array)
//print(array)
var result = [Int]()
for i in 0 ..< array.count {
    resize(array: &array)
    result.append(array.first!)
    array.removeFirst()
}
print(result)




