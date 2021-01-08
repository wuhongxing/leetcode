
func testzip() {
    var array1 = [1, 2, 3]
    var array2 = [11, 22, 33]
    
    for (i, j) in zip(array1.indices, array2.indices) {
        print(i, j)
    }
}
testzip()
