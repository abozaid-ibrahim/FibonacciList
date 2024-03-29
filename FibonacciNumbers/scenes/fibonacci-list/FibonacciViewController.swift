//
//  ViewController.swift
//  FibonacciNumbers
//
//  Created by abuzeid on 11/24/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import UIKit

final class FibonacciTableController: UITableViewController {
    private var fibonacciList: [Int: UInt64] = [:]

    var viewModel: FibonacciTableViewModelType! = FibonacciTableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fibonacci List"
        loadData()
    }

    private func loadData() {
        viewModel.getFibonacci(of: Int(UInt8.max), callback: { [weak self] result in
            self?.fibonacciList = result
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        })
    }
}

extension FibonacciTableController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return fibonacciList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let title = "F(\(indexPath.row)) = \(fibonacciList[indexPath.row]!)"
        cell.textLabel?.text = title
        return cell
    }
}
