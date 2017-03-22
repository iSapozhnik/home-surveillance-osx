//
//  SignalProviderTests.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import XCTest
@testable import HomeSurveillance

class SignalProviderTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAvailableProviders() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let provider = SignalProvider()
        let providers = provider.allProviders()
        XCTAssertTrue(providers.count >= 1, "SignalProvider sould return at least one provider")
    }

}
