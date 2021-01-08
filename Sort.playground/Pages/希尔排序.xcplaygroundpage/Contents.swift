
//func shellSort(_ nums: inout [Int]) {
//    var gap = nums.count / 2
//    let length = nums.count
//    while gap > 0 {
//        if gap == 1 {
//            for i in 1 ..< length {
//                let num = nums[i]
//                var index = i
//                for j in (0 ... i - 1).reversed() {
//                    if num < nums[j] {
//                        nums[j + 1] = nums[j]
//                    } else {
//                        index = j + 1
//                        break
//                    }
//                }
//                nums[index] = num
//            }
//        } else {
//            for i in 0 ..< length - gap {
//                if nums[i] > nums[i + gap] {
//                    let temp = nums[i]
//                    nums[i] = nums[i + gap]
//                    nums[i + gap] = temp
//                }
//            }
//        }
//        gap /= 2
//    }
//}

func shellSort(_ nums: inout [Int]) {
    var gap = nums.count / 2
    let length = nums.count
    while gap > 0 {
        for i in gap ..< length {
            var j = i
            let current = nums[i]
            while j - gap >= 0 && current < nums[j - gap] {
                nums[j] = nums[j - gap]
                j -= gap
            }
            nums[j] = current
        }
        gap /= 2
    }
}

var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
shellSort(&array)
