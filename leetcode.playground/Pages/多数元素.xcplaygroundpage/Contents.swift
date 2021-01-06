class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var maxCount = 1
        var dict = [Int: Int]()
        nums.forEach { (i) in
            if let count = dict[i] {
                if count + 1 > maxCount {
                    maxCount = count + 1
                }
                dict[i] = count + 1
            } else {
                dict[i] = 1
            }
        }
        for (k, v) in dict {
            if v == maxCount {
                return k
            }
        }
        return nums.first!
    }
}

class Solution1 {
    func majorityElement(_ nums: [Int]) -> Int {
        var result = 0
        for i in nums {
            result |= ~i
        }
        return result
    }
}
//10
//10   01
//11
//--
//10

//11
//10   01
//11
//--
//11


var solution = Solution1()
solution.majorityElement([3, 2, 3])
solution.majorityElement([2, 2, 1, 1, 1, 2, 2])
