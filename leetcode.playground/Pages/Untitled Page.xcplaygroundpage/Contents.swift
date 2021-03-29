/**
 颠倒给定的 32 位无符号整数的二进制位。
 */
class Solution {
    func reverseBits(_ n: Int) -> Int {
        var result = 0
        for i in 0 ..< 32 {
            // 如何取出指定位的数据
            result += (n >> i) & 1
            if i != 31 {
                result <<= 1
            }
        }
        return result
    }
}
var solution = Solution()
solution.reverseBits(0b00000010100101000001111010011100) == 0b00111001011110000010100101000000
solution.reverseBits(0b11111111111111111111111111111101) == 0b10111111111111111111111111111111
