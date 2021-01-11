/**
 猜数字游戏的规则如下：

 每轮游戏，我都会从 1 到 n 随机选择一个数字。 请你猜选出的是哪个数字。
 如果你猜错了，我会告诉你，你猜测的数字比我选出的数字是大了还是小了。
 你可以通过调用一个预先定义好的接口 int guess(int num) 来获取猜测结果，返回值一共有 3 种可能的情况（-1，1 或 0）：

 -1：我选出的数字比你猜的数字小 pick < num
 1：我选出的数字比你猜的数字大 pick > num
 0：我选出的数字和你猜的数字一样。恭喜！你猜对了！pick == num
 示例 1：

 输入：n = 10, pick = 6
 输出：6
 示例 2：

 输入：n = 1, pick = 1
 输出：1
 示例 3：

 输入：n = 2, pick = 1
 输出：1
 示例 4：

 输入：n = 2, pick = 2
 输出：2
 */

class Solution {
    var target = 6
    func guessNumber(_ n: Int) -> Int {
//        for i in 0 ... n {
//            if guess(i) == 0 {
//                return i
//            }
//        }
//        return 0
        //12345 123
        var low = 1
        var high = n
        var i = (low + high) / 2
        while guess(i) != 0 {
            if guess(i) == -1 {
                high = i - 1
            } else {
                low = i + 1
            }
            i = (low + high) / 2
        }
        return i
    }
    
    func guess(_ num: Int) -> Int {
        if target < num {
            return -1
        } else if target > num {
            return 1
        }
        return 0
    }
}

var solution = Solution()
solution.guessNumber(10)
