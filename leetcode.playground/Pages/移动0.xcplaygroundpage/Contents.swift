/**
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。
 */
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var res = [Int]()
        var z = 0
        for i in nums {
            if i != 0 {
                res.append(i)
            } else {
                z += 1
            }
        }
        (0 ..< z).forEach { (_) in
            res.append(0)
        }
        nums = res
    }
}

class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        var last = nums.count
        var ptr = 0
        while ptr < last {
            if nums[ptr] == 0 {
                for j in ptr ..< last {
                    if j + 1 == last {
                        nums[j] = 0
                    } else {
                        nums[j] = nums[j + 1]
                    }
                }
                last -= 1
            } else {
                ptr += 1
            }
        }
    }
}
var solution = Solution1()
var a = [0,1,0,3,12]
solution.moveZeroes(&a)
