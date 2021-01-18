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

func test() -> Bool {
    print("test")
    return true
}
var a: Bool? = true
//a ?? test()
a ?? test()

