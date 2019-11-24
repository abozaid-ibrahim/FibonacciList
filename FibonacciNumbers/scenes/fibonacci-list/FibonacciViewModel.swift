//
//  FibonacciViewModel.swift
//  FibonacciNumbers
//
//  Created by abuzeid on 11/24/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
protocol FibonacciTableViewModelType {
    func getFibonacci(from: Int64, to: Int64, callback: @escaping ([UInt64]) -> Void)
}

struct FibonacciTableViewModel: FibonacciTableViewModelType {
    // MARK: properties

    private var fibonacciList: [UInt64] = []

    func getFibonacci(from: Int64 = 0, to: Int64, callback: @escaping ([UInt64]) -> Void) {
        DispatchQueue.global(qos: .background).async {
            var fibonacciList: [UInt64] = []
            for index in from...to {
                if index == 0 {
                    fibonacciList.append(0)
                } else if index == 1 {
                    fibonacciList.append(1)
                } else {
                    if fibonacciList.count >= 2 { /// check if list have at lest 2 element
                        let prevIndex = fibonacciList.count - 1
                        let value = fibonacciList[prevIndex].addingReportingOverflow(fibonacciList[prevIndex - 1])
                        if value.overflow {
                            break
                        }
                        fibonacciList.append(value.partialValue)
                    }
                }
            }
            callback(fibonacciList)
        }
    }
}
