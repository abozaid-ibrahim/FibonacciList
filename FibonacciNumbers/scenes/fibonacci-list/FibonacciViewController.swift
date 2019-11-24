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

    override func viewDidLoad() {
        super.viewDidLoad()
        fibonacciList.append(1)
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
