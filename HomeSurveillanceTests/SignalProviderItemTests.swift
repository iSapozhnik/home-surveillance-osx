//
//  SignalProviderItemTests.swift
//  HomeSurveillance
//
//  Created by Sapozhnik Ivan on 22/03/17.
//  Copyright © 2017 Sapozhnik Ivan. All rights reserved.
//

import XCTest
import AVFoundation

@testable import HomeSurveillance

class SignalProviderItemTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreatingSignalProviderItem() {
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) as AVCaptureDevice
        let item = DefaultCameraProvider.provider(withCaptureDevice: captureDevice)
        XCTAssertNotNil(item, "Provider should not be nil")
    }
    
    func testProviderHasName() {
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) as AVCaptureDevice
        let item = DefaultCameraProvider.provider(withCaptureDevice: captureDevice)
        XCTAssertNotNil(item, "Provider should not be nil")
        XCTAssertFalse(item.name().isEmpty, "Provider should return name")
    }

}
