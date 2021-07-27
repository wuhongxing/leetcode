import Foundation

class Employee {
    var leaf: String?
    var name: String?
    var salary: Int?
    var sub = [Employee]()
    
    init(_ leaf: String? = nil, name: String? = nil, salary: Int? = nil) {
        self.leaf = leaf
        self.name = name
        self.salary = salary
    }
    
    func add(_ employee: Employee) {
        sub.append(employee)
    }
}

extension Employee: CustomDebugStringConvertible {
    var debugDescription: String {
        if let leaf = leaf {
            return leaf
        }
        return "name: \(String(describing: name!)), salary: \(String(describing: salary!))"
    }
}

let e0 = Employee("科技中心")
let e1 = Employee("技术研发部")
e1.add(Employee(name: "小星星", salary: 100))
e1.add(Employee(name: "中星星", salary: 1000))
e1.add(Employee(name: "大星星", salary: 10000))
let e2 = Employee("科技")
e2.add(Employee(name: "小猩猩", salary: 100))
e2.add(Employee(name: "中猩猩", salary: 1000))
e2.add(Employee(name: "大猩猩", salary: 10000))
e0.add(e1)
e0.add(e2)

func all(_ employee: Employee, depth: Int) {
    var string = "|"
    for _ in 0 ..< depth {
        string += "--"
    }
    print(string, employee)
    
    employee.sub.forEach { (e) in
        all(e, depth: depth + 1)
    }
}

all(e0, depth: 0)
