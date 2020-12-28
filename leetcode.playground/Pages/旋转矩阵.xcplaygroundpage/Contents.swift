/**
 给你一幅由 N × N 矩阵表示的图像，其中每个像素的大小为 4 字节。请你设计一种算法，将图像旋转 90 度。

 不占用额外内存空间能否做到？

 ```
 给定 matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 原地旋转输入矩阵，使其变为:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 ```
 */

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var count = matrix.count
        for i in 0 ..< count {
            for j in 0 ..< count {
                var temp = matrix[j][count - i]
                matrix[j][count - i] = matrix[i][j]
                matrix[i][j] = temp
            }
        }
    }
}

var solution = Solution()
var matrix = [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
solution.rotate(&matrix)
print(matrix)
