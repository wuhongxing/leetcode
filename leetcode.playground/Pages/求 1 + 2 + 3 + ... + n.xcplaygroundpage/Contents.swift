/**
 求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。

  

 示例 1：

 输入: n = 3
 输出: 6
 示例 2：

 输入: n = 9
 输出: 45
 */
class Solution {
    var result = 0
    func sumNums(_ n: Int) -> Int {
        print(result, n)
        if n > 1 {
            result += n
            sumNums(n - 1)
        }
        return result
    }
    
    func sumNums1(_ n: Int) -> Int {
        var result = 0
        for i in 0 ... n {
            result += i
        }
        return result
    }
}

class Solution1 {
    func sumNums(_ n: Int) -> Int {
        var sum = n
        (n > 0) && {
            sum += sumNums(n - 1)
            return true
        }()
        return sum
    }
}

var solution = Solution()
solution.sumNums1(3)
solution.sumNums1(9)

func get(_ v1: Int, _ v2: Int) -> Int {
    return v1 > 0 ? v1 : v2
}
get(10, 20)
get(-2, 20)
get(0, -4)
func get1(_ v1: Int, _ v2: () -> Int) -> Int {
    return v1 > 0 ? v1 : v2()
}
get1(10, { 20 })
get1(-2, { 20 })
get1(0, { -4 })

// `@autoclosure` 只适合**无参闭包**
func get2(_ v1: Int, _ v2: @autoclosure () -> Int) -> Int {
    return v1 > 0 ? v1 : v2()
}
get2(10, 20)
get2(-2, 20)
get2(0, -4)
