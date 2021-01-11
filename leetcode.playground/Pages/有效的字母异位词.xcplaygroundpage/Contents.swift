/**
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
 说明:
 你可以假设字符串只包含小写字母。

 进阶:
 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 */
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict = [Character: Int]()
        for c in s {
            if let count = dict[c] {
                dict[c] = count + 1
            } else {
                dict[c] = 1
            }
        }
        for c in t {
            if let count = dict[c] {
                dict[c] = count - 1
            } else {
                return false
            }
        }
        return dict.values.filter { $0 != 0 }.count == 0
    }
}

class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var dict = [Character: Int]()
        for c in s {
            if let count = dict[c] {
                dict[c] = count + 1
            } else {
                dict[c] = 1
            }
        }
        for c in t {
            if let count = dict[c] {
                if count - 1 < 0  {
                    return false
                }
                dict[c] = count - 1
            } else {
                return false
            }
        }
        return true
    }
}

class Solution2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        return s.sorted() == t.sorted()
    }
}
var solution = Solution2()
solution.isAnagram("anagram", "nagaram")
solution.isAnagram("rat", "car")
