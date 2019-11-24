//
//  ViewController.swift
//  FibonacciNumbers
//
//  Created by abuzeid on 11/24/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import UIKit

final class FibonacciTableController: UITableViewController {
    private var fibonacciList: [UInt64] = []

    var viewModel: FibonacciTableViewModelType! = FibonacciTableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    private func loadData(){
        viewModel.getFibonacci(from: 0, to: Int64.max, callback: { [weak self] result in
            self?.fibonacciList = result
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        })
    }
}

extension FibonacciTableController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibonacciList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let title = "F(\(indexPath.row)) = \(fibonacciList[indexPath.row])"
        cell.textLabel?.text = title
        return cell
    }
}
