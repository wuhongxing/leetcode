func fb1(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    }
    return fb1(n - 1) + fb1(n - 2)
}
// 88 次
//fb1(10)
// 143 次
fb1(11)


func fb2(_ n: Int) -> Int {
    var dp = [Int]()
    dp.append(1)
    dp.append(1)
    if n > 2 {
        for i in 2 ... n {
            dp.append(dp[i - 1] + dp[i - 2])
        }
    }
    return dp[n]
}
fb2(11)

func fb3(_ n: Int) -> Int {
    var dp1 = 1
    var dp2 = 1
    if n > 2 {
        for _ in 2 ..< n + 1 {
            dp2 += dp1
        }
    }
    return dp2
}
fb3(11)
