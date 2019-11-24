//
//  FibonacciTableViewTests.swift
//  FibonacciTableViewTests
//
//  Created by Ayman Fathy on 9/23/19.
//  Copyright © 2019 Smart Mobile Factory. All rights reserved.
//

import XCTest
@testable import FibonacciTableView

class FibonacciTableViewTests: XCTestCase {

    func test_oneElementinList() {
        
        let oneElementExpectation = XCTestExpectation(description: "oneElementinList")
        let fibonacciViewController = FibonacciViewController()
        fibonacciViewController.startCalculateFibonacci(to: Int64(0), callback: {  fibonacciList in
            oneElementExpectation.fulfill()
            XCTAssert(fibonacciList.count == 1, "one element in array")
            XCTAssertEqual(fibonacciList[0], 0, "the F(0) = 0")
        })
        wait(for: [oneElementExpectation], timeout: 10.0)
    }

    func test_twoElementinList() {

        let twoElementExpectation = XCTestExpectation(description: "twoElementinList")
        let fibonacciViewController = FibonacciViewController()
        fibonacciViewController.startCalculateFibonacci(to: Int64(1), callback: { fibonacciList in
            twoElementExpectation.fulfill()
            XCTAssert(fibonacciList.count == 2, "two element in array")
            XCTAssertEqual(fibonacciList[1], 1, "the F(1) = 1")
        })
        wait(for: [twoElementExpectation], timeout: 10.0)
    }

    func test_reandomValueInList() {

        let randomElementExpectation = XCTestExpectation(description: "reandomValueInList")
        let fibonacciViewController = FibonacciViewController()
        fibonacciViewController.startCalculateFibonacci(to: Int64(10), callback: { fibonacciList in
            randomElementExpectation.fulfill()
            XCTAssert(fibonacciList.count == 11, "ten element in array")
            XCTAssertEqual(fibonacciList[10], 55, "the F(10) = 55")
        })
        wait(for: [randomElementExpectation], timeout: 10.0)
    }

}
