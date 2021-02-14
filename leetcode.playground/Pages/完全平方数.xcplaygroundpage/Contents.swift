/**
 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。

 示例 1:

 输入: n = 12
 输出: 3
 解释: 12 = 4 + 4 + 4.
 示例 2:

 输入: n = 13
 输出: 2
 解释: 13 = 4 + 9.
 */

class Solution {
    func numSquares(_ n: Int) -> Int {
        var temp = n
        var result = 0
        for i in 0 ..< n {
            print(i * i)
            if i * i > temp && temp > 0 {
                temp -= (i - 1) * (i - 1)
                result += 1
            }
        }
        return result
    }
}

var solution = Solution()
solution.numSquares(13)
solution.numSquares(12)

[1: 1].map { (k, v) -> [Int: Int] in
    return [k + 1: v + 1]
}

//let t = { a in
//    a + 1
//}
//t(1)
extension Int {
    func test(_ f: () -> Int) -> Int {
        print(f())
        return f()
    }
}

1.test {
    return 1
}.test {
    return 2
}.test {
    return 3
}

class T {
    let t = {
        return $0 + 1
    }
    let t1: (() -> T) -> T = { f in
        return f()
    }
}
let t = T()
t.t1 {
    print(1)
    return t
}.t1 {
    print(2)
    return t
}

func HStack(_ fn: () -> Void) {
    fn()
}

struct View {
    init(_ text: String) {
        
    }
    func b() -> Self {
        print("11")
        return self
    }
}

func add() -> () -> Int {
    var count = 0
    func test() -> Int {
        count += 1
        return count
    }
    return test
}
let r = add()
r()
r()
r()

// 闭包
let a: () -> Int = {
    var count = 0
    func test() -> Int {
        count += 1
        return count
    }
    return test
}()
a()
a()
a()
a()

var count = 0
// 闭包表达式
let b: () -> Int = {
    func test() -> Int {
        count += 1
        return count
    }
    return test
}()
count += 1
count += 1
b()
b()
b()
b()

