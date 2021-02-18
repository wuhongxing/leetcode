/**
 实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。
 示例 1：

 输入：x = 2.00000, n = 10
 输出：1024.00000
 示例 2：

 输入：x = 2.10000, n = 3
 输出：9.26100
 示例 3：

 输入：x = 2.00000, n = -2
 输出：0.25000
 解释：2-2 = 1/22 = 1/4 = 0.25
 */

class Solution {
    // 这个如果不碰到大数是可以的，但是一旦碰到了大数的话，就会超时
    func myPow1(_ x: Double, _ n: Int) -> Double {
        var result = x
        var temp = n
        while temp != 0 {
            if temp > 0 {
                temp -= 1
                result *= x
            }
            if temp < 0 {
                temp += 1
                result /= x
            }
        }
        return result / x
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1
        } else if n % 2 == 1 {
            return myPow(x, n - 1) * x
        } else if n % 2 == -1 {
            return myPow(x, n + 1) / x
        } else {
            let temp = myPow(x, n >> 1)
            return temp * temp
        }
    }
}
let solution = Solution()
solution.myPow(2, 10)
//solution.myPow(2.1, 3)
//solution.myPow(2, -2)
