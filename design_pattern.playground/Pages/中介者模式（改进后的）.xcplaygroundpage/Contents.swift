import Foundation

class AbstractColleague {
    private var mediator: Mediator
    
    init(_ mediator: Mediator) {
        self.mediator = mediator
    }
}

class Mediator {
    weak var purchase: Purchase!
    weak var stock: Stock!
    weak var sale: Sale!
    
    func excute(_ method: String, object: Int...) {
        switch method {
        case "buyIBMComputer":
            buyIBMComputer(object[0])
        case "clearStock":
            clearStock()
        case "sellIBMComputer":
            sellIBMComputer(object[0])
        case "offSale":
            offSale()
        default:
            break
        }
    }
    
    private func buyIBMComputer(_ number: Int) {
        guard let stock = stock else { return }
        guard let sale = sale else { return }
        let saleStatus = sale.getSaleStatus()

        if saleStatus > 80 {
            print("采购 IBM Computer\(number)台")
            stock.increase(number)
        } else {
            let buyNumber = number / 2
            print("采购 IBM Computer\(buyNumber)台")
            stock.increase(buyNumber)
        }
    }
    
    private func clearStock() {
        guard let purchase = purchase else { return }
        guard let sale = sale else { return }
        print("清除存货数量\(Stock.number)")
        sale.offSale()
        purchase.refuseBuyIBM()
    }
    
    private func sellIBMComputer(_ number: Int) {
        guard let stock = stock else { return }
        guard let purchase = purchase else { return }
        if stock.getStockNumber() < number {
            purchase.buyIBMComputer(number)
        }
        print("销售 IBM Computer\(number)台")
        stock.decrease(number)
    }
    
    private func offSale() {
        guard let stock = stock else { return }
        print("折价销售 IBM Computer\(stock.getStockNumber())台")
    }
}

class Purchase: AbstractColleague {
    func buyIBMComputer(_ number: Int) {
        mediator.excute("buyIBMComputer", object: number)
    }
    
    func refuseBuyIBM() {
        print("不再采购 IBM Computer")
    }
}

class Stock {
    static var number = 100
    
    func increase(_ number: Int) {
        Self.number += number
        print("库存增加后总数量: \(Self.number)")
    }
    
    func decrease(_ number: Int) {
        Self.number -= number
        print("库存减少后剩余数量: \(Self.number)")
    }
    
    func getStockNumber() -> Int {
        return Self.number
    }
    
    func clearStock() {
        mediator.excute("clearStock")
    }
}

class Sale {
    func sellIBMComputer(_ number: Int) {
        mediator.excute("sellIBMComputer", object: number)
    }

    func getSaleStatus() -> Int {
        let random =  Int(arc4random() % 100)
        print("IBM Computer 的销售情况为：\(random)")
        return random
    }
    
    func offSale() {
        mediator.excute("offSale")
    }
}

let mediator = Mediator()
let purchase = Purchase(mediator)
mediator.purchase = purchase
let sale = Sale()
mediator.sale = sale
let stock = Stock()
mediator.stock = stock
print("========采购人员采购电脑========")
purchase.buyIBMComputer(100)
print("========销售人员销售电脑========")
sale.sellIBMComputer(1)
print("========库存管理人员管理库存========")
stock.clearStock()
