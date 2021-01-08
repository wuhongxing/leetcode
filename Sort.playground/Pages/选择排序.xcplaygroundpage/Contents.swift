
func selectionSort(_ nums: inout [Int]) {
    let count = nums.count
    for i in 0 ..< count {
        var minIndex = i
        
        for j in i + 1 ..< count {
            if nums[j] < nums[i] {
                minIndex = j
            }
        }
        
        let temp = nums[i]
        nums[i] = nums[minIndex]
        nums[minIndex] = temp
    }
}

var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
selectionSort(&array)
