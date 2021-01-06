/**
 给定一个包含 [0, n] 中 n 个数的数组 nums ，找出 [0, n] 这个范围内没有出现在数组中的那个数。

  

 进阶：

 你能否实现线性时间复杂度、仅使用额外常数空间的算法解决此问题?
  

 示例 1：

 输入：nums = [3,0,1]
 输出：2
 解释：n = 3，因为有 3 个数字，所以所有的数字都在范围 [0,3] 内。2 是丢失的数字，因为它没有出现在 nums 中。
 示例 2：

 输入：nums = [0,1]
 输出：2
 解释：n = 2，因为有 2 个数字，所以所有的数字都在范围 [0,2] 内。2 是丢失的数字，因为它没有出现在 nums 中。
 示例 3：

 输入：nums = [9,6,4,2,3,5,7,0,1]
 输出：8
 解释：n = 9，因为有 9 个数字，所以所有的数字都在范围 [0,9] 内。8 是丢失的数字，因为它没有出现在 nums 中。
 示例 4：

 输入：nums = [0]
 输出：1
 解释：n = 1，因为有 1 个数字，所以所有的数字都在范围 [0,1] 内。1 是丢失的数字，因为它没有出现在 nums 中。
  

 提示：

 n == nums.length
 1 <= n <= 104
 0 <= nums[i] <= n
 nums 中的所有数字都独一无二
 */
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var array = [Int]()
        (0 ... nums.count).forEach { (i) in
            array.append(i)
        }
        for i in nums {
            array.removeAll { $0 == i }
        }
        return array[0]
    }
}

class Solution1 {
    func missingNumber(_ nums: [Int]) -> Int {
        var set1 = Set<Int>()
        (0 ... nums.count).forEach { set1.insert($0) }
        let set2 = Set(nums)
        return set1.subtracting(set2).randomElement()!
    }
}

class Solution2 {
    func missingNumber(_ nums: [Int]) -> Int {
        let sum0 = (0 ... nums.count).reduce(0) { $0 + $1 }
        let sum1 = nums.reduce(0) { $0 + $1 }
        return sum0 - sum1
    }
}

class Solution3 {
    func missingNumber(_ nums: [Int]) -> Int {
        var missing = nums.count
        for i in 0 ..< nums.count {
            missing ^= i ^ nums[i]
        }
        return missing
    }
}

let solution = Solution2()
solution.missingNumber([0, 1])
solution.missingNumber([3, 0, 1])
solution.missingNumber([0])
