//
//  ViewController.swift
//  算法学习
//
//  Created by wuhongxing on 2021/7/27.
//

import UIKit

class Model {
    var a: String?
    var b: String?
    var c: String?
}

class A {
    deinit {
        print("A 被释放了")
    }
}

class B {
    deinit {
        print("B 被释放了")
    }
}

class ViewController: UIViewController {
    
    let node = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3, TreeNode(6), TreeNode(7)))
//    let node = TreeNode(1, TreeNode(2), TreeNode(3))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        testMaxDepth()
//        testTraversal()
//        benchmark()
//        var a = 0.1
//        var b = 0.2
//        var r = a + b
//        print(0.1 + 0.2 == 0.3)
//        var fa = Float(0.1)
//        var fb = Float(0.2)
//        var fr = fa + fb
//        print(fr)
//        var da = Decimal(a)
//        var db = Decimal(b)
//        var dr = da + db
//        print(dr)
        let a = A()
        test(a: a)
//        sleep(2)
    }
    
    private func test(a: A) {
        let b = B()
        test1()
        sleep(2)
    }
    private func test1() {
        print("test1")
    }

    private func benchmark() {
        var a = [Int]()
        let start = CACurrentMediaTime()
        // 0.48 - 0.49
        // 使用元组交换和中间变量交换效率没有区别
//        for _ in 0 ..< 1_000_000 {
//            (a, b) = (b, a)
//        }
//        for _ in 0 ..< 1_000_000 {
//            let c = a
//            b = c
//            a = b
//        }
        // 0.234
        var b = [Int]()
        for i in a {
            if i % 2 == 0 {
                b.append(i + 1)
            }
        }
        
        // 0.225
        var c = [Int]()
        for i in a where i % 2 == 0 {
            c.append(i + 1)
        }
        
        // 0.286
        let _ = a
            .filter { $0 % 2 == 0 }
            .map { $0 + 1 }
        
        let end = CACurrentMediaTime()
        print(end - start)
    }
    
    private func test(callback: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            callback()
        }
//        callback()
    }

    private func testMaxDepth() {
        let solution = MaxDepth()
        let result = solution.maxDepth(node)
        print("result: ",result)
    }
    
    private func testTraversal() {
        let solution = Traversal()
//        print("==========先序遍历==========")
//        solution.traversal(node)
//        solution.traversal1(node)
        print("==========中序遍历==========")
        solution.traversal2(node)
        print("==========后序遍历==========")
//        solution.traversal3(node)
    }
}

