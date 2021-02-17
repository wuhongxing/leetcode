/**
 给你一个字符串 s，找到 s 中最长的回文子串。
 */
class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        var array = [String]()
        
        return s
    }
    
    func isRevserse(_ s: String) -> Bool {
        return true
    }
}
var solution = Solution()
solution.longestPalindrome("babad")
solution.longestPalindrome("cbbd")
solution.longestPalindrome("a")
solution.longestPalindrome("ac")
