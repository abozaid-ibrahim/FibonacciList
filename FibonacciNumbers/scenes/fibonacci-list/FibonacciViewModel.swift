//
//  FibonacciViewModel.swift
//  FibonacciNumbers
//
//  Created by abuzeid on 11/24/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
protocol FibonacciTableViewModelType {
    func getFibonacci(of number: Int, callback: @escaping ([Int: UInt64]) -> Void)
}

final class FibonacciTableViewModel: FibonacciTableViewModelType {
    // MARK: properties

    private var fibMemoList: [Int: UInt64] = [:]

    func getFibonacci(of number: Int, callback: @escaping ([Int: UInt64]) -> Void) {
        // TODO: Use NSThread to change stack size and accept bigger numbers
        DispatchQueue.global().sync { [weak self] in
            guard let self = self else { return }
            _ = try? self.fibonacci(of: number)
            callback(self.fibMemoList)
        }
    }

    private func fibonacci(of number: Int) throws -> UInt64 {
        /// base
        guard number != 0, number != 1 else {
            fibMemoList[number] = UInt64(number)
            return UInt64(number)
        }
        // calculated Before
        if let value2 = fibMemoList[number - 1] {
            if let value1 = fibMemoList[number - 2] {
                let value = value2.addingReportingOverflow(value1)
                if value.overflow {
                    throw Err.overflow
                } else {
                    fibMemoList[number] = value.partialValue
                    return value.partialValue
                }
            }
        }
        // calculate New
        guard let value = try? fibonacci(of: number - 1).addingReportingOverflow(fibonacci(of: number - 2)) else {
            throw Err.overflow
        }

        if value.overflow {
            throw Err.overflow
        } else {
            fibMemoList[number] = value.partialValue
            return value.partialValue
        }
    }
}

enum Err: Error {
    case overflow
}
