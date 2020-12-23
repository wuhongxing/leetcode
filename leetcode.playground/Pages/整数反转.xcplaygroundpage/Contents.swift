/**
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 
 ```
 输入: 123
 输出: 321
 
 输入: -123
 输出: -321
 
 输入: 120
 输出: 21
 ```
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        var temp = x < 0 ? -x : x
        var result = 0
        while temp / 10 > 0 {
            result += temp % 10
            result *= 10
            temp /= 10
        }
        result += temp
        return (result > 2147483647 || result < -2147483648) ? 0 : (x < 0 ? -result : result)
    }
}

var solution = Solution()
solution.reverse(123)
solution.reverse(-123)
solution.reverse(120)
