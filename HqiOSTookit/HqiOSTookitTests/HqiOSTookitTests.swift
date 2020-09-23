//
//  HqiOSTookitTests.swift
//  HqiOSTookitTests
//
//  Created by hehuiqi on 2020/9/18.
//

import XCTest
@testable import HqiOSTookit

class HqiOSTookitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

        let phone = ["name":"apple","price":"1.0","amount":2] as [String:Any]
        let query = HqString.hq_dicToQueryParams(dic: phone)
        print(query)
        let dic = HqString.hq_queryParamsToDic(queryParamStr: query)
        print(dic)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
