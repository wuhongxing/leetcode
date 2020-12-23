/**
 给定一个整数，写一个函数来判断它是否是 4 的幂次方。如果是，返回 true ；否则，返回 false 。

 整数 n 是 4 的幂次方需满足：存在整数 x 使得 n == 4x

 ```
 输入：n = 16
 输出：true
 
 输入：n = 5
 输出：false
 
 输入：n = 1
 输出：true
 ```
 */
// 方法一：乘法
class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        var temp = 1
        while temp < n {
            temp *= 4
        }
        return temp == n
    }
}

// 方法二：除法
class Solution1 {
    func isPowerOfFour(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        var temp = n
        while temp % 4 == 0 {
            temp /= 4
        }
        return temp == 1
    }
}

// 方法三：位运算
class Solution2 {
    func isPowerOfFour(_ n: Int) -> Bool {
        return n > 0 && n  & (n - 1) == 0 && n & 0xaaaaaaaa == 0
    }
}

var solution = Solution2()
solution.isPowerOfFour(1)
solution.isPowerOfFour(4)
solution.isPowerOfFour(16)
solution.isPowerOfFour(0)
solution.isPowerOfFour(17)
solution.isPowerOfFour(10)
solution.isPowerOfFour(68)
solution.isPowerOfFour(-2147483648)
