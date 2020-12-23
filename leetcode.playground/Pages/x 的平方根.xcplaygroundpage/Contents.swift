/**
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 ```
 输入: 4
 输出: 2
 
 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。
 ```
 */
// 比较暴力的解法，穷举
class Solution {
    func mySqrt(_ x: Int) -> Int {
        for i in 0 ... x {
            if x < i * i {
                return i - 1
            }
            if x == i {
                return i
            }
        }
        return -1
    }
}

// 看看二分法是不是能解决
class Solution1 {
    func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        var result = -1
        while left <= right {
            var mid = left + (right - left) / 2
            if mid * mid <= x {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}

// 

var solution = Solution1()
solution.mySqrt(0)
solution.mySqrt(1)
solution.mySqrt(2)
solution.mySqrt(4)
solution.mySqrt(8)
solution.mySqrt(9)
solution.mySqrt(15)
solution.mySqrt(16)

