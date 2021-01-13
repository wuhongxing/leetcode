/**
 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。

 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。

 ```
 输入：["h","e","l","l","o"]
 输出：["o","l","l","e","h"]
 ```
 */
class Solution {
    func reverseString(_ s: inout [Character]) {
        let i = s.count / 2
        for j in 0 ..< i {
            (s[j], s[s.count - j - 1]) = (s[s.count - j - 1], s[j])
        }
    }
}

var solution = Solution1()
var a: [Character] = ["h","e","l","a","l","o"]
solution.reverseString(&a)
a
