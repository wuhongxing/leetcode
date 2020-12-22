//: [Previous](@previous)
/**
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 
 ```
 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 ```
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in 0 ..< nums.count {
            if let index = dict[nums[i]] {
                return [index, i]
            } else {
                dict[target - nums[i]] = i
            }
        }
        return []
    }
}

/**
 优化代码
 不用再根据 `nums[i]` 取出元素了
 */
class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let index = dict[num] {
                return [index, i]
            } else {
                dict[target - num] = i
            }
        }
        return []
    }
}

var solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))

var solution1 = Solution1()
print(solution1.twoSum([2, 7, 11, 15], 9))
