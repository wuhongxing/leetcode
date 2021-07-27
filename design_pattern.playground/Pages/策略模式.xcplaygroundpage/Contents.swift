//: [Previous](@previous)

import Foundation

// Comparator 就是一个策略模式

protocol Strategy {
    func doOperation(num1: Int, num2: Int) -> Int
}

class OperationAdd: Strategy {
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}

class OperationSubtract: Strategy {
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
}

class OperationMultiply: Strategy {
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
}

class Context {
    private let strategy: Strategy
    
    init(_ strategy: Strategy) {
        self.strategy = strategy
    }
    
    func executeStrategy(num1: Int, num2: Int) -> Int {
        return strategy.doOperation(num1: num1, num2: num2)
    }
}

let context = Context(OperationAdd())
print(context.executeStrategy(num1: 1, num2: 2))
