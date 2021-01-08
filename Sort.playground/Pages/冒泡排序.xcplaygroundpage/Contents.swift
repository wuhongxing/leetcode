
func bubbleSort(_ nums: inout [Int]) {
    let count = nums.count
    for i in 0 ..< count - 1 {
        for j in 0 ..< count - 1 - i {
            if nums[j] > nums[j + 1] {
                let temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
            }
        }
    }
}

var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
bubbleSort(&array)
