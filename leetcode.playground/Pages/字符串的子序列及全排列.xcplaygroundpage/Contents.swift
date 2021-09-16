import Foundation

// 计算一个字符串的所有子序列
// abc => [a, b, c, ab, ac, bc, abc]
func allSequence(_ string: String) -> [String] {
    var result = [String]()
    process(string, 0, "", &result)
    return result
}

func process(_ string: String, _ index: Int, _ path: String, _ ans: inout [String]) {
    if index == string.count {
        ans.append(path)
        return
    }
    process(string, index + 1, path, &ans)
    let newPath = path + String(string[string.index(string.startIndex, offsetBy: index)])
    process(string, index + 1, newPath, &ans)
}

print(allSequence("abc"))
