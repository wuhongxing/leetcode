/**
 两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

 给出两个整数 x 和 y，计算它们之间的汉明距离。
 
 ```
 输入: x = 1, y = 4

 输出: 2

 解释:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑

 上面的箭头指出了对应二进制位不同的位置。
 ```
 */

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var z = x ^ y
        var result = 0
        while z > 0 {
            if z & 1 == 1 {
                result += 1
            }
            z = z >> 1
        }
        return result
    }
}
var solution = Solution()
solution.hammingDistance(4, 4)
