/**
 给你一个长度为 n 的整数数组，请你判断在 最多 改变 1 个元素的情况下，该数组能否变成一个非递减数列。

 我们是这样定义一个非递减数列的： 对于数组中所有的 i (0 <= i <= n-2)，总满足 nums[i] <= nums[i + 1]。

 ```
 输入: nums = [4,2,3]
 输出: true
 解释: 你可以通过把第一个4变成1来使得它成为一个非递减数列。
 
 输入: nums = [4,2,1]
 输出: false
 解释: 你不能在只改变一个元素的情况下将其变为非递减数列。
 ```
 */

class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var sum = 0
        var nums1 = nums
        for i in 1 ..< nums.count {
            if (nums1[i - 1] > nums1[i]) {
                sum += 1
                if sum >= 2 {
                    return false
                }
                if i - 2 >= 0 && nums1[i - 2] > nums1[i] {
                    nums1[i] = nums1[i - 1]
                } else {
                    nums1[i - 1] = nums1[i]
                }
            }
        }
        return true

    }
}
