protocol IHandler {
    func handle()
}

class HandlerA: IHandler {
    func handle() {
        print("handle A")
    }
}

class HandlerB: IHandler {
    func handle() {
        print("handle B")
    }
}

class HandlerChain: IHandler {
    private var array = [IHandler]()
    func addHandler(_ handler: IHandler) {
        array.append(handler)
    }
    
    func handle() {
        array.forEach { $0.handle() }
    }
}

//private let chain = HandlerChain()
//chain.addHandler(HandlerA())
//chain.addHandler(HandlerB())
//chain.handle()

protocol IHandler1 {
    func handle() -> Bool
}

class HandlerA1: IHandler1 {
    func handle() -> Bool {
        print("handle A")
        return false
    }
}

class HandlerB1: IHandler1 {
    func handle() -> Bool {
        print("handle B")
        return true
    }
}

class HandlerChain1: IHandler1 {
    private var array = [IHandler1]()
    func addHandler(_ handler: IHandler1) {
        array.append(handler)
    }
    
    func handle() -> Bool {
        var result = true
        for item in array {
            result = item.handle()
            if !result {
                break
            }
        }
        return result
    }
}

//private let chain = HandlerChain1()
//chain.addHandler(HandlerA1())
//chain.addHandler(HandlerB1())
//chain.handle()

// 责任链如何将一个执行结果作为另一个的输入值
import Foundation

class Request {
    var message: String?
}

class Response {
    var message: String?
}

protocol Filter {
    func doFilter(request: Request, response: Response, chain: FilterChain)
}

class FilterChain: Filter {
    private var filterArray = [Filter]()
    
    func addFilter(filter: Filter) -> Self {
        filterArray.append(filter)
        return self
    }
    
    var index: Int = -1
    
    func doFilter(request: Request, response: Response, chain: FilterChain) {
        index += 1
        if index < filterArray.count {
            print(index)
            filterArray[index].doFilter(request: request, response: response, chain: chain)
        }
    }
}

class AFilter: Filter {
    func doFilter(request: Request, response: Response, chain: FilterChain) {
        request.message?.append("A")
        chain.doFilter(request: request, response: response, chain: chain)
        response.message?.append("A")
    }
}

class BFilter: Filter {
    func doFilter(request: Request, response: Response, chain: FilterChain) {
        request.message?.append("B")
        chain.doFilter(request: request, response: response, chain: chain)
        response.message?.append("B")
    }
}

let chain = FilterChain()
chain.addFilter(filter: AFilter())
chain.addFilter(filter: BFilter())
let request = Request()
request.message = "request"
let response = Response()
response.message = "response"
chain.doFilter(request: request, response: response, chain: chain)
print(request.message, response.message)
