//
//  FibonacciNumbersTests.swift
//  FibonacciNumbersTests
//
//  Created by abuzeid on 11/24/19.
//  Copyright © 2019 abuzeid. All rights reserved.
//

@testable import FibonacciNumbers
import XCTest

class FibonacciNumbersTests: XCTestCase {
    var viewModel: FibonacciTableViewModelType!

    override func setUp() {
        viewModel = FibonacciTableViewModel()
    }

    override func tearDown() {
        viewModel = nil
    }

    func testFibonacciOfZero() {
        let oneElementExpectation = XCTestExpectation(description: "zero")
        viewModel.getFibonacci(of: 0, callback: { fibonacciList in
            XCTAssert(fibonacciList.count == 1)
            XCTAssertEqual(fibonacciList[0], 0)
            oneElementExpectation.fulfill()
        })
        wait(for: [oneElementExpectation], timeout: 0.5)
    }

    func testFibonacciOfOne() {
        let twoElementExpectation = XCTestExpectation(description: "one")
        viewModel.getFibonacci(of: 1, callback: { fibonacciList in
            XCTAssert(fibonacciList.count == 2)
            XCTAssertEqual(fibonacciList[1], 1)
            twoElementExpectation.fulfill()
        })
        wait(for: [twoElementExpectation], timeout: 0.5)
    }

    func testValidFibonacci() {
        let randomElementExpectation = XCTestExpectation(description: "many")
        viewModel.getFibonacci(of: 10, callback: { fibonacciList in
            XCTAssert(fibonacciList.count == 11)
            XCTAssertEqual(fibonacciList[10], 55)
            randomElementExpectation.fulfill()
        })
        wait(for: [randomElementExpectation], timeout: 10.0)
    }

}
