import Foundation

class Cat: Shoutable {
    func shout() {
        print("miao miao miao ...")
    }
}

class Dog: Shoutable {
    func shout() {
        print("wang wang wang ...")
    }
}

protocol Shoutable {
    func shout()
}

// =========下面是 client 的代码===========
//let cat = Cat()
//cat.shout()

//let dog = Dog()
//dog.shout()

// 使用工厂方法重构
enum ShoutType {
    case cat
    case dog
}
class ShoutFactory {
    func create(_ type: ShoutType) -> Shoutable {
        switch type {
        case .cat:
            return Cat()
        case .dog:
            return Dog()
        }
    }
    
    // 通过传入的 className 直接构造对应的对象
    func create(_ className: String) -> Shoutable {
        guard let bundleName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String else {
                return Cat()
            }
        print(bundleName)
        return Cat()
    }
}

//let factory = ShoutFactory().create(.cat)
//factory.shout()

let factory = ShoutFactory().create("Cat")
factory.shout()


