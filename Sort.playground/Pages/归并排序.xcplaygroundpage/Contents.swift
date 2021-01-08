
//func mergeSort(_ nums: [Int]) -> [Int] {
//    let length = nums.count
//    if length < 2 {
//        return nums
//    }
//    let middle = length / 2
//    let left = nums[0 ..< middle]
//    let right = nums[middle ..< length]
//    return merge(mergeSort(Array(left)), mergeSort(Array(right)))
//}
//
//func merge(_ left: [Int], _ right: [Int]) -> [Int] {
//    var res = [Int]()
//    var tleft = left
//    var tright = right
//    while tleft.count > 0 && tright.count > 0 {
//        if tleft.first! <= tright.first! {
//            res.append(tleft.first!)
//            tleft.removeFirst()
//        } else {
//            res.append(tright.first!)
//            tright.removeFirst()
//        }
//    }
//    if tleft.count > 0 {
//        res.append(contentsOf: tleft)
//    }
//    if tright.count > 0 {
//        res.append(contentsOf: tright)
//    }
//    return res
//}

//var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
//print(mergeSort(array))

func mergeSort(_ nums: [Int]) -> [Int] {
    let length = nums.count
    if length < 2 {
        return nums
    }
    let middle = nums.count / 2
    nums.sorted()
    return merge(mergeSort(Array(nums[0 ..< middle])), mergeSort(Array(nums[middle ..< length])))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var res = [Int]()
    var tleft = left
    var tright = right
    while tleft.count > 0 && tright.count > 0 {
        if tleft.first! <= tright.first! {
            res.append(tleft.first!)
            tleft.removeFirst()
        } else {
            res.append(tright.first!)
            tright.removeFirst()
        }
    }
    if tleft.count > 0 {
        res.append(contentsOf: tleft)
    }
    if tright.count > 0 {
        res.append(contentsOf: tright)
    }
    return res
}

var array = [1, 3, 5, 7, 9, 2, 4, 6, 8, 10, 1, 3, 5, 7, 9, 2, 4, 6, 8, 10]
print(mergeSort(array))
