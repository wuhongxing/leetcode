/**
 面试题 08.05. 递归乘法
 递归乘法。 写一个递归函数，不使用 * 运算符， 实现两个正整数的相乘。可以使用加号、减号、位移，但要吝啬一些。

 示例1:

  输入：A = 1, B = 10
  输出：10
 示例2:

  输入：A = 3, B = 4
  输出：12
 提示:
  011
  100
: 1110
 保证乘法范围不会溢出
 */
class Solution {
    // 暴力递归会导致段分配错误
    func multiply1(_ A: Int, _ B: Int) -> Int {
        if A == 1 && B == 1 {
            return 1
        }
        if A == 1 {
            return multiply(A, B - 1) + A
        }
        return multiply(A - 1, B) + B
    }
    
    func multiply(_ A: Int, _ B: Int) -> Int {
        if A <= 1 && B <= 1 {
            return A + B
        }
        if A == 1 {
            return multiply(A, B >> 1) + B >> 1
        }
        return multiply(A >> 1, B) + A >> 1
    }
}
let solution = Solution()
//solution.multiply(1, 10)
//solution.multiply(3, 4)
//solution.multiply(1, 918795921)

//var a = true
//if a {
//    print("执行咯")
//}
//func p() -> Bool {
//    print("执行咯")
//    return true
//}
//a && {
//    print("执行咯")
//    return true
//}()
//a && p()
//nil ?? {
//    print("执行咯")
//}()
func p() -> String {
    print("执行咯")
    return "123"
}

"a" ?? p()
