/**
 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。

 说明：本题中，我们将空字符串定义为有效的回文串。

 示例 1:

 输入: "A man, a plan, a canal: Panama"
 输出: true
 示例 2:

 输入: "race a car"
 输出: false
 */
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var array = [Character]()
        s.forEach { c in
            if c.isNumber || c.isLetter {
                array.append(contentsOf: c.uppercased())
            }
        }
        
        var low = 0
        var high = array.count - 1
        while low < high {
            if array[low] != array[high] {
                return false
            }
            low += 1
            high -= 1
        }
        return true
    }
}

class Solution1 {
    func isPalindrome(_ s: String) -> Bool {
        var array = [Character]()
        s.forEach { c in
            if c.isNumber || c.isLetter {
                array.append(contentsOf: c.uppercased())
            }
        }
        return array == array.reversed()
    }
}
var solution = Solution1()
solution.isPalindrome("A man, a plan, a canal: Panama")
solution.isPalindrome("race a car")
