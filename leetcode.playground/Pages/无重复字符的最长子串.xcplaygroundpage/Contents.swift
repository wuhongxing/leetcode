/**
 给定一个字符串，请你找出其中不含有重复字符的**最长子串**的长度。
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        var maxLen = 0
        var dict = [Character: Int]()
        var pre = 0
        for (index, char) in s.enumerated() {
            if let i = dict[char] {
                pre = pre > i ? pre : i + 1
                if index - pre > maxLen {
                    maxLen = index - pre
                }
            }
            if index - pre >= maxLen  {
                maxLen += 1
            }
            dict[char] = index
        }
        return maxLen
    }
}

class Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else {
            return s.count
        }
        var dict = [Character: Int]()
        var maxLen = 0
        var pre = 0
        for (index, char) in s.enumerated() {
            if let i = dict[char] {
                pre = max(pre, i + 1)
                maxLen = max(index - pre, maxLen)
            }
            if index - pre >= maxLen  {
                maxLen += 1
            }
            dict[char] = index
        }
        return maxLen
    }
}

var solution = Solution1()
print(solution.lengthOfLongestSubstring("abcabcbb"))
print(solution.lengthOfLongestSubstring("bbbbb"))
print(solution.lengthOfLongestSubstring("pwwkew"))
print(solution.lengthOfLongestSubstring("abc"))
print(solution.lengthOfLongestSubstring("aab"))
print(solution.lengthOfLongestSubstring("jxdlnaaij"))
print(solution.lengthOfLongestSubstring("tmmzuxt"))


