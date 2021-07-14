//: [Previous](@previous)

import Foundation

class BatterCake {
    func desc() -> String {
        return "煎饼果子"
    }
    
    func cost() -> Int {
        return 5
    }
}

class BatterCakeWithEgg: BatterCake {
    override func desc() -> String {
        return super.desc() + "加鸡蛋"
    }
    
    override func cost() -> Int {
        return super.cost() + 2
    }
}

class BatterCakeWithSausage: BatterCake {
    override func desc() -> String {
        return super.desc() + "加香肠"
    }
    
    override func cost() -> Int {
        return super.cost() + 2
    }
}

let cake = BatterCakeWithEgg()
print(cake.desc() + ":" + "\(cake.cost())" + "元")


// 如果我现在要同时加一根香肠还有一个鸡蛋怎么办？
// 再新建一个类？

protocol Saleable {
    func cost() -> Int
    func desc() -> String
}

class BatterCakeNew: Saleable {
    func desc() -> String {
        return "煎饼果子"
    }
    
    func cost() -> Int {
        return 5
    }
}

class BatterCakeNewWithEggDecorator: Saleable {
    private let cake: Saleable
    
    init(_ cake: Saleable) {
        self.cake = cake
    }
    
    func desc() -> String {
        return cake.desc() + "加鸡蛋"
    }
    
    func cost() -> Int {
        return cake.cost() + 2
    }
}

class BatterCakeNewWithSausageDecorator: Saleable {
    private let cake: Saleable
    
    init(_ cake: Saleable) {
        self.cake = cake
    }
    
    func desc() -> String {
        return cake.desc() + "加烤肠"
    }
    
    func cost() -> Int {
        return cake.cost() + 2
    }
}

let cakeNew = BatterCakeNew()
let decorator = BatterCakeNewWithEggDecorator(cakeNew)
let decorator1 = BatterCakeNewWithSausageDecorator(decorator)
print(decorator1.desc() + ":" + "\(decorator1.cost())" + "元")


