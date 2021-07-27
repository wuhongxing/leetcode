//: [Previous](@previous)

import Foundation
import UIKit

// UITableView 的复用就是一个典型的享元模式的运用
// 频繁创建和回收对象是一个非常消耗性能的过程，如果这个时候可以用空间去换时间的话，那么还是非常赚的
// 但是空间肯定不是一文不值的，要知道在浪费空间的时候我们到底要注意什么
// 比如对象最终是怎么被存在内存中了，如果使用的过多会不会导致空间不够用
// 然后导致频繁的命中失败之类的问题
// 后面的部分只是猜想，待验证
let begin = CACurrentMediaTime()
// 无属性五次的值
// 0.05007291400397662
// 0.04737106499669608
// 0.04791301500517875
// 0.04610951800714247
// 0.04638480200082995

// 继承于 UIView 后
// 0.6728563189972192
// 0.6753897559974575
// 0.6688884840114042
// 0.6533221309946384
// 0.679726115995436

// 继承于 UITableViewCell 之后
// 2.548028941004304
// 2.5715138480009045
// 2.69800807700085
// 2.60115160899295
// 2.5702595930051757
// 经验证和是否使用 xib 性能上无明显差距
let a = Set(arrayLiteral: UIView(), UIView(), UIView(), UIView(), UIView())
for _ in 0 ... 100_000 {
    a.first
}
let end = CACurrentMediaTime()
print(end - begin)

class TableView {
    var views = Set<UIView>()
    
    func get() -> UIView {
        if views.count > 0 {
            let first = views.first
            views.removeFirst()
            return first!
        }
        return UIView()
    }
    
    func recycle(_ view: UIView) {
        if views.count > 10 {
            views.removeFirst()
        }
        views.insert(view)
    }
}

let tableView = TableView()
let view = tableView.get()
tableView.recycle(view)
let view1 = tableView.get()
tableView.recycle(view1)
