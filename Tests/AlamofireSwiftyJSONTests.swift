//
//  AlamofireSwiftyJSONTests.swift
//  AlamofireSwiftyJSONTests
//
//  Created by Pinglin Tang on 14-9-23.
//  Copyright (c) 2014年 SwiftJSON. All rights reserved.
//

import Alamofire
import AlamofireSwiftyJSON
import SwiftyJSON
import XCTest

class AlamofireSwiftyJSONTests: XCTestCase {
    func testGETRequestJSONResponse() {
        let URL = "http://httpbin.org/get"
        let parameters: Parameters = ["foo": "bar"]
        let expect = expectation(description: "responseSwiftyJSON method should work")
        AF.request(URL, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .responseSwiftyJSON { response in
                XCTAssertNotNil(response.request, "request should not be nil")
                XCTAssertNotNil(response.response, "response should not be nil")
                XCTAssertNil(response.error, "result error should be nil")
                XCTAssertEqual(response.value?["args"], SwiftyJSON.JSON(["foo": "bar"] as NSDictionary), "args should be equal")
                expect.fulfill()
            }
        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
