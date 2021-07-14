import Foundation

class Purchase {
    func buyIBMComputer(_ number: Int) {
        let stock = Stock()
        let sale = Sale()
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
        let purchase = Purchase()
        let sale = Sale()
        print("清除存货数量\(Self.number)")
        sale.offSale()
        purchase.refuseBuyIBM()
    }
}

class Sale {
    func sellIBMComputer(_ number: Int) {
        let stock = Stock()
        let purchase = Purchase()
        if stock.getStockNumber() < number {
            purchase.buyIBMComputer(number)
        }
        print("销售 IBM Computer\(number)台")
        stock.decrease(number)
    }
    
    func getSaleStatus() -> Int {
        let random =  Int(arc4random() % 100)
        print("IBM Computer 的销售情况为：\(random)")
        return random
    }
    
    func offSale() {
        let stock = Stock()
        print("折价销售 IBM Computer\(stock.getStockNumber())台")
    }
}

print("========采购人员采购电脑========")
let purchase = Purchase()
purchase.buyIBMComputer(100)
print("========销售人员销售电脑========")
let sale = Sale()
sale.sellIBMComputer(1)
print("========库存管理人员管理库存========")
let stock = Stock()
stock.clearStock()


// 上面这个代码一看就是稀烂，耦合的太严重了
// 想想要怎么改进
