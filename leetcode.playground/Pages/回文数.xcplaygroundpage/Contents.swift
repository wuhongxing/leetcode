/**
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。例如，121 是回文，而 123 不是。
 */

class Solution {
    // 这里使用循环来做
    // 相当于把原数颠倒一下，看看是不是和原数相等
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var temp = x
        var result = 0
        while temp / 10 > 0 {
            result += temp % 10
            result *= 10
            temp /= 10
        }
        return result + temp == x
    }
    
    
    func isPalindrome1(_ x: Int) -> Bool {
        
        return true
    }
}
var solution = Solution()
solution.isPalindrome(121)
solution.isPalindrome(-121)
solution.isPalindrome(12321)
solution.isPalindrome(10)
