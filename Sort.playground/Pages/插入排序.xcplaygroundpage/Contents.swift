//func insertionSort(_ nums: inout [Int]) {
//    let count = nums.count
//    for i in 1 ..< count {
//        let temp = nums[i]
//        var index = i
//        for j in (0 ... i - 1).reversed() {
//            if temp < nums[j] {
//                nums[j + 1] = nums[j]
//            } else {
//                index = j + 1
//                break
//            }
//        }
//        nums[index] = temp
//    }
//}

func insertionSort(_ nums: inout [Int]) {
    let count = nums.count
    for i in 1 ..< count {
        let temp = nums[i]
        var j = i - 1
        while nums[j] > temp {
            nums[j + 1] = nums[j]
            j -= 1
        }
        nums[j + 1] = temp
    }
}


var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
insertionSort(&array)
