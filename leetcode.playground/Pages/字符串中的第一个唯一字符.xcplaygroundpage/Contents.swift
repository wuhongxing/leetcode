/**
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
 
 ```
 s = "leetcode"
 返回 0

 s = "loveleetcode"
 返回 2
 ```
 */
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        guard s.count > 0 else { return -1 }
        var dict = [Character: Int]()
        for (index, char) in s.enumerated() {
            if let _ = dict[char] {
                dict[char] = -1
            } else {
                dict[char] = index
            }
        }
        let result = dict.values.filter { $0 > -1 }.sorted { $0 < $1 }.first ?? -1
        return result
    }
}

class Solution1 {
    func firstUniqChar(_ s: String) -> Int {
        guard s.count > 0 else { return -1 }
        var dict = [Character: Int]()
        for (index, char) in s.enumerated() {
            if let _ = dict[char] {
                dict[char] = -1
            } else {
                dict[char] = index
            }
        }
        var result = s.count + 1
        // 这个算法的时间复杂度应该会比上面的链式效率更高些
        dict.forEach { result = $0.value == -1 ? result : min(result, $0.value) }
        return result > s.count ? -1 : result
    }
}

var solution = Solution1()
solution.firstUniqChar("leetcode")
solution.firstUniqChar("loveleetcovd")
