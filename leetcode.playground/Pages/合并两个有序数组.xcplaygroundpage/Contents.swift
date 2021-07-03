/*
 给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。
 */

// 这题有思路，但是具体的没写出来，后期再想想看
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let middle = nums1[m - 1]
        for i in (0 ..< n).reversed() {
            if nums2[i] > middle {
                nums1[m + i] = nums2[i]
            } else {
                
            }
        }
    }
}

let solution = Solution()
var nums1 = [1, 2, 3, 0, 0, 0]
solution.merge(&nums1, 3, [2, 5, 6], 3)
print(nums1)



