//
//  ViewController.swift
//  算法学习
//
//  Created by wuhongxing on 2021/7/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testMaxDepth()
    }

    private func testMaxDepth() {
        let solution = MaxDepth()
        let node = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        let result = solution.maxDepth(node)
        print("result: ",result)
    }
}

