//: [Previous](@previous)

import Foundation

// 元素相对稳定但访问方式多种多样
// 不常用

protocol Bill {
    func accept(_ v: AccountBookViewer)
}

protocol AccountBookViewer {
    func view(_ bill: ConsumeBill)
    func view(_ bill: IncomeBill)
}

class ConsumeBill: Bill {
    var amount: Double = 0
    var item: String = ""
    
    func accept(_ v: AccountBookViewer) {
        v.view(self)
    }
}

class IncomeBill: Bill {
    var amount: Double = 0
    var item: String = ""
    
    func accept(_ v: AccountBookViewer) {
        v.view(self)
    }
}

class Boss: AccountBookViewer {
    var totalIncome: Double = 0
    var totalConsume: Double = 0
    func view(_ bill: ConsumeBill) {
        totalConsume += bill.amount
    }
    
    func view(_ bill: IncomeBill) {
        totalIncome += bill.amount
    }
}

class Cpa: AccountBookViewer {
    func view(_ bill: ConsumeBill) {
        print("查看是否交个人所得税")
    }
    
    func view(_ bill: IncomeBill) {
        print("收入是否交税了")
    }
}

class AccountBook {
    private var billList = [Bill]()
    
    func addBill(_ bill: Bill) {
        billList.append(bill)
    }
    
    func show(_ viewer: AccountBookViewer) {
        billList.forEach {
            $0.accept(viewer)
        }
    }
}

// 上面的账本及账本中支出和收入是确定的
// 但是看账本的人不确定
// 这个模式在于在增加一种元素，比如支出2，那么就非常不友好了

let accountBook = AccountBook()
accountBook.addBill(IncomeBill())
accountBook.addBill(IncomeBill())

accountBook.addBill(ConsumeBill())
accountBook.addBill(ConsumeBill())

var boss = Boss()
var cpa = Cpa()

accountBook.show(boss)
accountBook.show(cpa)

print(boss.totalIncome, boss.totalConsume)

