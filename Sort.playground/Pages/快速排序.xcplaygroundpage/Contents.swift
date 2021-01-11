
func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
    if low >= high {
        return
    }
    var i = low
    var j = high
    let key = nums[i]
    while i < j {
        while i < j && nums[j] >= key {
            j -= 1
        }
        nums[i] = nums[j]
        while i < j && nums[i] <= key {
            i += 1
        }
        nums[j] = nums[i]
    }
    nums[i] = key
    print(nums)
    quickSort(&nums, low, i - 1)
    quickSort(&nums, i + 1, high)
}

var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
//var array1 = [5, 3, 7, 6, 4, 1, 0, 2, 9, 10, 8]
//var array1 = [2, 5, 6, 3, 1]
//var array1 = [3, 1, 2]
/// 213
/// 123
var array1 = [3, 2, 1]
// 123
// 123
//var array1 = [5, 6, 3]
//var array1 = [10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8]
quickSort(&array1, 0, array1.count - 1)
print(array1)

//func quickSort(_ nums: [Int]) -> [Int] {
//    if nums.count > 0 {
//        let middle = nums[0]
//        return quickSort(nums.filter { $0 < middle }) + [middle] + quickSort(nums.filter { $0 > middle })
//    }
//    return []
//}
//
//var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
//print(quickSort(array))
