/**
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 如果数组中不存在目标值 target，返回 [-1, -1]。

 进阶：

 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
 示例 1：

 输入：nums = [5,7,7,8,8,10], target = 8
 输出：[3,4]
 示例 2：

 输入：nums = [5,7,7,8,8,10], target = 6
 输出：[-1,-1]
 示例 3：

 输入：nums = [], target = 0
 输出：[-1,-1]
 
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else { return [-1, -1] }
        var result = [-1, -1]
        for i in 0 ..< nums.count {
            if nums[i] == target {
                if result[0] == -1 {
                    result[0] = i
                }
            } else {
                if result[0] != -1 {
                    if result[1] == -1 {
                        result[1] = i - 1
                    }
                    print(result)
                }
            }
        }
        if result[0] != -1 && result[1] == -1 {
            result[1] = nums.count - 1
        }
        return result
    }
    
    // TODO: 这里还可以用二分法优化、然后再用递归写
    func searchRange1(_ nums: [Int], _ target: Int) -> [Int] {
        return []
    }
}

//var solution = Solution()
//solution.searchRange([5,7,7,8,8,10], 8)
//solution.searchRange([1,2,3], 1)
//solution.searchRange([5,7,7,8,8,10], 6)
//solution.searchRange([], 8)


class Solution1 {
    // 二分法要特别注意中间节点的处理
    func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count
        while left < right {
            let middle = (right + left - 1) / 2
            if nums[middle] == target {
                return true
            } else if nums[middle] < target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        return false
    }
    
    func binarySearch1(_ nums: [Int], _ target: Int) -> Bool {
        guard nums.count > 0 else {
            return false
        }
        return help(0, nums.count, nums, target)
    }

    // 递归的辅助函数
    func help(_ left: Int, _ right: Int, _ nums: [Int], _ target: Int) -> Bool {
        if left < right {
            let middle = (right + left - 1) / 2
            if nums[middle] == target  {
                return true
            } else if nums[middle] < target {
                return help(middle + 1, right, nums, target)
            } else {
                return help(left, middle, nums, target)
            }
        }
        return false
    }
}

var solution1 = Solution1()
//solution1.binarySearch([], 0)
//solution1.binarySearch([0], 1)
//solution1.binarySearch([0,1], 0)
//solution1.binarySearch([0,1,2], 0)
//solution1.binarySearch([0,1,2], 3)
//solution1.binarySearch([0,1,2,3], 0)

solution1.binarySearch1([], 0)
solution1.binarySearch1([0], 1)
solution1.binarySearch1([0], 0)
solution1.binarySearch1([0,1], 0)
solution1.binarySearch1([0,1,2], 0)
solution1.binarySearch1([0,1,2], 3)
solution1.binarySearch1([0,1,2], 2)
solution1.binarySearch1([0,1,2,3], 0)
solution1.binarySearch1([0,1,2,3], 3)
