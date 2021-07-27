import Foundation

protocol Observer {
    func doSomething()
}

class Baby {
    private var observers = [Observer]()
    func cry() {
        print("宝宝哭了")
        observers.forEach {
            $0.doSomething()
        }
    }
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
}

class Mom: Observer {
    func doSomething() {
        print("妈妈喂奶")
    }
}

class Dad: Observer {
    func doSomething() {
        print("爸爸抱抱")
    }
}

class Dog: Observer {
    func doSomething() {
        print("wang wang wang ...")
    }
}

let baby = Baby()
baby.addObserver(Mom())
baby.addObserver(Dad())
baby.addObserver(Dog())
baby.cry()

/// 上面是观察者的核心模式
