//
//  FibonacciViewModel.swift
//  FibonacciNumbers
//
//  Created by abuzeid on 11/24/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

import Foundation
protocol FibonacciTableViewModelType {
    func startCalculateFibonacci(from: Int64 , to: Int64, callback: @escaping ([UInt64]) -> Void)

}

struct FibonacciTableViewModel: FibonacciTableViewModelType {
    // MARK: properties
    
    private var fibonacciList: [UInt64] = []
    
    func startCalculateFibonacci(from: Int64 = 0, to: Int64, callback: @escaping ([UInt64]) -> Void) {
       
    }
}
