class Solution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var _g = g.sorted()
        var _s = s.sorted()
        
        var ptr2 = 0
        var result = 0
        for i in 0 ..< g.count {
            for j in ptr2 ..< s.count {
                if _s[j] >= _g[i] {
                    result += 1;
                    ptr2 = j + 1
                    break
                }
            }
        }
        return result
    }
}

var solution = Solution()
solution.findContentChildren([1, 2, 3], [1, 1])
solution.findContentChildren([1, 2], [1, 2, 3])
solution.findContentChildren([1, 2, 3], [3])
