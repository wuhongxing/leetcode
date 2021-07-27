//: [Previous](@previous)

import Foundation

enum MMState {
    case happy
    case sad
}

//class MM {
//    var name: String = ""
//    var state: MMState = .happy
//
//    func smile() {
//        switch state {
//        case .happy:
//            print("开心的笑")
//        case .sad:
//            print("苦笑")
//        }
//    }
//
//    func cry() {
//        switch state {
//        case .happy:
//            print("开心的哭")
//        case .sad:
//            print("大哭")
//        }
//    }
//
//    func say() {
//        switch state {
//        case .happy:
//            print("开心的说")
//        case .sad:
//            print("吐苦水")
//        }
//    }
//}
//
//let mm = MM()
//mm.state = .happy
//mm.say()

// 上述的代码要如何进行改写呢？
protocol MMAction {
    func smile()
    func say()
    func cry()
}

class HappyMM: MMAction {
    func smile() {
        print("开心的笑")
    }
    
    func say() {
        print("开心的说")
    }
    
    func cry() {
        print("开心的哭")
    }
}

class SadMM: MMAction {
    func smile() {
        print("苦笑")
    }
    
    func say() {
        print("吐苦水")
    }
    
    func cry() {
        print("大哭")
    }
}

class MM: MMAction {
    var name: String = ""
    let happyMM = HappyMM()
    let sadMM = SadMM()
    var _state: MMAction {
        return state == .happy ? happyMM : sadMM
    }
    var state: MMState = .happy
    
    func smile() {
        _state.smile()
    }
    
    func say() {
        _state.say()
    }
    
    func cry() {
        _state.cry()
    }
}

let mm = MM()
mm.say()
mm.state = .sad
mm.say()

// 根据状态的不同，决定怎么实现
// operation 无法进行扩展的时候，并且 state 未来会进行扩展的时候
// 那这个和策略模式有什么不同呢？
