// 如果有 callback 出现，是没有办法使用责任链进行处理的
// 这个时候我们应该考虑使用 promise 或者 rx 来解决
// 后面研究一下这两个库是怎么解决问题的?


























import Foundation

var list = ["a", "b", "c", "d"]

func rmA(_ list: [String]) {
    var tempList = list
    tempList.removeAll { $0 == "a" }
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print(tempList, "rmA")
        rmB(tempList)
    }
}

func rmB(_ list: [String]) {
    var tempList = list
    tempList.removeAll { $0 == "b" }
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print(tempList, "rmB")
        rmC(tempList)
    }
    
}

func rmC(_ list: [String]) {
    var tempList = list
    tempList.removeAll { $0 == "c" }
    print(tempList, "rmC")
}

//rmA(list)

// ===========上面是用普通模式直接累出来的============
protocol Intercept {
    func rmAppreciation(_ chain: Chain) -> [String]
}

class AIntercept: Intercept {
    let semaphore = DispatchSemaphore(value: 1)
    func rmAppreciation(_ chain: Chain) -> [String] {
        var tempList = chain.list
        tempList.append("A")
        tempList.removeAll { $0 == "a" }
//        return chain.rmAppreciation(Chain(tempList))
        var response = [String]()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.semaphore.signal()
            response = chain.proceed(tempList)
            response.append("reseponseA")
        }
        self.semaphore.wait()
        return response
    }
}

class BIntercept: Intercept {
    func rmAppreciation(_ chain: Chain) -> [String] {
        var tempList = chain.list
        tempList.append("B")
        tempList.removeAll { $0 == "b" }
//        return chain.rmAppreciation(Chain(tempList))
        print("休息")
        sleep(1)
        print("休息完成")
        var response = chain.proceed(tempList)
        response.append("reseponseB")
        return response
    }
}

//class Chain: Intercept {
//    var list = [String]()
//    private var intercepts = [Intercept]()
//    var index = -1
//
//
//    init(_ list: [String]) {
//        self.list = list
//    }
//
//    func addIntercept(intercept: Intercept) -> Self {
//        intercepts.append(intercept)
//        return self
//    }
//
//    func rmAppreciation(_ chain: Chain) -> [String] {
//        index += 1
//        if index < intercepts.count {
//            return intercepts[index].rmAppreciation(chain)
//        }
//        return chain.list
//    }
//}

class Chain {
    var list = [String]()
    private var intercepts = [Intercept]()
    var index = 0
    
    
    init(_ list: [String], index: Int, intercepts: [Intercept]) {
        self.list = list
        self.index = index
        self.intercepts = intercepts
    }
    
    init() {
        
    }
    
    func addIntercept(intercept: Intercept) -> Self {
        intercepts.append(intercept)
        return self
    }
    
    func proceed(_ list: [String]) -> [String] {
        guard index < intercepts.count else {
            return list
        }
        let intercept = intercepts[index]
        let chain = Chain(list, index: index + 1, intercepts: intercepts)
        return intercept.rmAppreciation(chain)
    }
}

let chain = Chain()
chain.addIntercept(intercept: AIntercept())
    .addIntercept(intercept: BIntercept())
let rmList = chain.proceed(list)
print(list, rmList)

