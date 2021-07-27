import Foundation

class Observable {
    private var block: (() -> Any)!
    convenience init(_ block: @escaping () -> Any) {
        self.init()
        self.block = { block() }
    }
    
    func subscribe(_ block: (Any) -> Void) {
        block(self.block())
    }
}

// 观察者
protocol Observer {
    func doSomething()
}

let ob = Observable {
    print("12345")
    return "12345678"
}
print("主执行")
ob.subscribe {
    print($0)
}

// 后面要学习 rx 在这块是怎么分层的，以及他为什么要这么分？
