/**
 给定一个由若干 0 和 1 组成的数组 A，我们最多可以将 K 个值从 0 变成 1 。

 返回仅包含 1 的最长（连续）子数组的长度。

 示例 1：

 输入：A = [1,1,1,0,0,0,1,1,1,1,0], K = 2
 输出：6
 解释：
 [1,1,1,0,0,1,1,1,1,1,1]
 粗体数字从 0 翻转到 1，最长的子数组长度为 6。
 示例 2：

 输入：A = [0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], K = 3
 输出：10
 解释：
 [0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1]
 粗体数字从 0 翻转到 1，最长的子数组长度为 10。
 */

class Solution {
    func longestOnes1(_ A: [Int], _ K: Int) -> Int {
        var result = 0
        for i in 0 ..< A.count {
            var zero = 0
            for j in i ..< A.count {
                if A[j] == 0 {
                    zero += 1
                    if zero > K {
                        result = max(result, j - i)
                        break
                    }
                }
                if zero <= K {
                    result = max(result, j - i + 1)
                }
            }
        }
        return result
    }
    
    func longestOnes(_ A: [Int], _ K: Int) -> Int {
        
    }
}
let solution = Solution()
solution.longestOnes([1,1,1,0,0,1,1,1,1,1,0,1,1,1,1], 2)
solution.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2)
solution.longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3)
